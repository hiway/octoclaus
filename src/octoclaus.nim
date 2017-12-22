import asyncdispatch, asyncnet, strutils
import jester, htmlgen, cgi, logging
import yaml.serialization, streams
import osproc, terminal

system.addQuitProc(resetAttributes)

var L = newConsoleLogger()
addHandler(L)

type WebCommand = object
  name : string
  desc : string
  raw  : string

proc error(msg: string) =
  styledWriteLine(stderr, fgRed, "Error: ", resetStyle, msg)

var commandList: seq[WebCommand]
var commandNames: seq[string] = @[]

var s = newFileStream("commands.yaml")
load(s, commandList)
s.close()

for cmd in commandList:
  styledWriteLine(stderr, fgBlue, "Command: ", resetStyle, cmd.name)
  commandNames.add($cmd.name)

settings:
  port = Port(8080)
  bindAddr = "127.0.0.1"

proc layout(content: string): string =
  htmlgen.html(htmlgen.body(
    script(src="/nim.js", `type`="text/javascript"),
    script(src="/client.js", `type`="text/javascript"),
    link(href="/app.css", rel="stylesheet"),
    content
    ))

routes:
  get "/":
    var commands = ""
    for cmd in commandList:
      commands.add(li(span(cmd.desc), button(`class`="command", cmd.name)))
    var content = `div`(
        `div`(
          h1("Octoclaus"),
          ul(commands),
          `class`="sidebar"),
        `div`(id="output"),
        `class`="wrapper",
        )
    body.add(layout(content))
    status = Http200

  get "/nim.js":
    const nimJS = staticRead "nim.js"
    resp nimJS


  get "/client.js":
    const result = staticExec "nim -d:release js client"
    const clientJS = staticRead "nimcache/client.js"
    resp clientJS

  get "/app.css":
    const appCSS = staticRead "app.css"
    resp appCSS

  get "/@name":
    let name = decodeUrl(@"name")
    if not (name in commandNames):
      body = h1("Whoa there!")
      status = Http404
      return
    for command in commandList:
      if command.name == name:
        let outp = execProcess(command.raw)
        logging.debug("RUN " & command.raw)
        logging.debug("OUT " & outp)
        body = "$ " & command.raw & "\n"
        body.add(outp.string)
        status = Http200
        break

runForever()
