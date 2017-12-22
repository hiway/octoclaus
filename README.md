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
