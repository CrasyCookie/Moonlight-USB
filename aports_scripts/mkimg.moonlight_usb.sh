profile_moonlight_usb() {
	profile_standard
	title="Moonlight USB"
	desc="A moonlight/tailscale live ISO
		* Runs from RAM
		* Includes AMD and Intel microcode"
	profile_abbrev="moonlight_usb"
	arch="x86 x86_64 armv7 armhf aarch64"
    hostname="moonlight-usb"
	boot_addons="amd-ucode intel-ucode"
	initrd_ucode="/boot/amd-ucode.img /boot/intel-ucode.img"
	apks="$apks linux-firmware
		bwm-ng networkmanager
		ufw dosfstools efibootmgr
		grub grub-bios grub-efi

        moonlight-qt tailscale
    "
	local flavor addon
	for flavor in $kernel_flavors; do
		apks="$apks linux-$flavor"
		for addon in $kernel_addons; do
			apks="$apks $addon-$flavor"
		done
	done
	apkovl="genapkovl-moonlight_usb.sh"
}
