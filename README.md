# octoclaus

Web frontend for your commonly-executed commands.

![screen shot 2017-12-22 at 18 10 15](https://user-images.githubusercontent.com/23116/34298361-674e5964-e743-11e7-92df-fb67af6a5596.png)

## Install

Tested on MacOS Sierra and above.

Grab an archive for your platform from:
https://github.com/hiway/octoclaus/releases

Unzip and run

```bash
$ ./octoclaus
```

Copy / link to user `bin`:

```bash
$ cp octoclaus /usr/local/bin/octoclaus
```

## Install from source

Assumes that you have XCode, homebrew and git installed.

```bash
$ brew install nim
$ git clone https://github.com/hiway/octoclaus.git
$ cd octoclaus
$ nimble build
$ ./octoclaus
```

## Usage

Edit the `commands.yaml` file to suit your needs:

```yaml
---
- name: uname
  desc: "Get uname of host."
  raw: "uname -a"

- name: ping
  desc: "Pings a known server."
  raw: "ping -c 1 8.8.8.8"
```

- `name` is a short URL safe string, spaces are fine here.
- `desc` is free-form description of what the command does.
- `raw` is the raw command as sent to shell.

## Limitations:

- Commands are static, no way to provide options from web.
- Commands are executed synchronously.
- Long-running commands do not display progress.
