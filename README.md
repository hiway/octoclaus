# octoclaus

Web frontend for your commonly-executed commands.

![screen shot 2017-12-22 at 18 10 15](https://user-images.githubusercontent.com/23116/34298361-674e5964-e743-11e7-92df-fb67af6a5596.png)

## Install

Tested on:
    - MacOS Sierra
    - FreeBSD 11.1

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

On MacOS: Assumes that you have `homebrew` `git` and `nim` installed.
On FreeBSD: Assumes that you have `git` and `nim` installed.

```bash
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

## Limitations

- Commands are static, no way to provide options from web.
- Commands are executed synchronously.
- Long-running commands do not display progress.

## Why

I have been working on server automation and often feel
the need to have ansible scripts or rundeck set up for my
weekend-experiment-VPSes, raspberry pi and the various
computers I have connected to my home network.

Each of these machines serves one or two roles, and I
end up using the same set of commands on those machines
on a regular basis.

Octoclaus is an experiment to see if I can reduce the
friction in my workflows by enabling easy access to
most-run commands right in my browser.

For security, I run all my remote machines behind a VPN,
and the firewall at home keeps the clients inside home
WiFi bridged to the VPN - each instance of octoclaus binds
to the internal/VPN interface instead of all or public IPs.

*cough* The real reason is that I needed an excuse to take
Nim for a test drive, and the first release is what's
possible after only two days of immersing myself in Nim.

I can imagine using this fantastic language and ecosystem
for many projects that would benefit from the ease of
distribution that Nim allows - single static binary and
the expressive syntax to make development just as painless
as working with Python.

Contributions welcome!
