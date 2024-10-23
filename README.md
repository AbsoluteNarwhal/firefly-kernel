# Firefly

An operating system kernel hobby project.

## How to build and run the kernel

Building Firefly requires lots of different apps and dependencies, including a cross-compiler which is a pain to set up. Docker has been used to simplify this. You will also probably want some kind of virtualisation software such as QEMU, and maybe the Bochs debugging software.

### Using Docker:

1. If the Docker Daemon isn't already running (some Linux distributions), use `sudo systemctl start docker`.

2. Run `docker build buildenv -t firefly-buildenv`. You only need to do this once.

3. Run the script `run-docker.sh`.

4. In docker, run `make build-x86_64`.

5. Exit docker, and run the script `qemu-x64.sh`.

### Without Docker:

- You will need access to a Unix-like system in order to use certain tools, most notably GCC and Make. Linux is the most recommended operating system for this kind of stuff, however windows users can use WSL or cygwin.
- You will need to cross-compile using GCC (target x86_64-elf) in order to compile and assemble the kernel.

Additionally, you will need the following:
- Xorriso
- GRUB (including grub-mkrescue)
- Make
- NASM

The following are strongly recommended:
- QEMU
- Bochs, for debugging.

GCC Cross-compiling will require you to compile both GCC and binutils from source. You will also need the following:
- Bison
- Flex
- GMP
- MPC
- MPFR
- Texinfo
- (Optional) ISL

Once all of that is set up, simply run `make build-x86_64` to build the kernel and `sh qemu-x64.sh` to run it.