import htmlgen, dom

proc showOutput(output: string) {.exportc.} =
  var infoDiv = document.getElementById("output")
  infoDiv.innerHTML = pre(output)

const
  endpoint = "/"

proc lazyRequest(endpoint: cstring): cstring {.importc.}

proc outputListener(event: ref TEvent) =
  let
    output = document.getElementById("output")
    command = $event.target.innerHTML
    api = lazyRequest(endpoint & command)
  output.innerHTML = "<pre>" & $api & "</pre>" & $output.innerHTML

proc stuff(event: ref TEvent) =
  for elem in document.getElementsByClassName("command"):
    elem.addEventListener("click", outputListener, useCapture=true)

window.addEventListener("load", stuff)
