
version      = "0.1.0"
author       = "Harshad Sharma"
description  = "Web frontend for your commonly-executed commands."
license      = "None"
installFiles = @["octoclaus.nim"]
bin = @["octoclaus"]
srcDir = "src"

requires "nim >= 0.15.2", "jester", "yaml"

