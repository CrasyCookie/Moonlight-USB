# Moonlight USB ISO builder
**WARNING: I am currently just testing this concept. Will not work out of the box. Subject to drastic change.**
**This repo is not affiliated with moonlight, tailscale or other projects.**

These scripts create a lot of (potentially unsecure) byproducts which are not cleaned up, and are meant to run in a clean throwaway environment. Usually that is a virtual machine.

## How to use
1. Setup a virtual machine with alpine linux
2. Clone this repository
`git clone https://github.com/CrasyCookie/Moonlight-USB.git`
3. Edit `settings.sh` to fit your purpose
4. Run `generate.sh` and follow instructions. You will have to run it multiple times, and you will be told when it's done
5. Build the image using `build.sh`
