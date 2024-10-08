# Moonlight USB ISO builder
**WARNING: I am currently just testing this concept. Will not work out of the box. Subject to drastic change.**
**This repo is not affiliated with moonlight, tailscale or other projects.**

These scripts create a lot of (potentially unsecure) byproducts which are not cleaned up, and are meant to run in a clean throwaway environment. Usually that means a virtual machine.

## How to use
1. Setup a virtual machine with alpine linux
2. Clone this repository
`git clone <repository> <build path>`
3. Edit `settings.sh` to fit your purpose
4. Run `make_iso.sh` and follow instructions. You will have to run it multiple times, and it will tell you when it is done.
