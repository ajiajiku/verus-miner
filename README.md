# Verus Miner

Pre-compiled **ccminer VerusHash** setup for Termux on ARM64 devices.

This repository provides a simple installer that downloads the ARM64 `ccminer` binary and supporting files from the upstream Darktron/pre-compiled repository at installation time.

## Requirements

- Android device with ARM64 (arm64-v8a) support
- Termux
- Internet connection

## Install

In Termux, run:

```sh
pkg update -y
pkg install wget -y
wget https://raw.githubusercontent.com/ajiajiku/verus-miner/main/install.sh
chmod +x install.sh
./install.sh
```

The installer creates `~/ccminer`, downloads the pre-compiled miner, configuration and start script, then makes the required files executable.

## Configure

Edit the mining configuration:

```sh
nano ~/ccminer/config.json
```

Change `user` to your own Verus wallet address and worker name. The `algo` is `verus`.

## Start

```sh
~/ccminer/start.sh
```

## Upstream

The pre-compiled ARM64 binary and original setup are from Darktron/pre-compiled:
https://github.com/Darktron/pre-compiled

Use this software at your own risk. Mining can increase device temperature, power consumption and battery wear.
