{ ... }: {

	flake.nixosModules.hardware-configuration =

		{ config, lib, modulesPath, ... }: {

			imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

			boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "vmd" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
			boot.initrd.kernelModules = [ ];
			boot.kernelModules = [ "kvm-intel" ];
			boot.extraModulePackages = [ ];

			fileSystems = {

				"/" = {
					device = "/dev/disk/by-uuid/fdfb566d-f74f-4a85-804f-bbc37fb63f01";
					fsType = "btrfs";
					options = [ "subvol=ROOT" "compress=zstd" "noatime" ];
				};

				"/nix" = {
					device = "/dev/disk/by-uuid/fdfb566d-f74f-4a85-804f-bbc37fb63f01";
					fsType = "btrfs";
					options = [ "subvol=NIX" "compress=zstd" "noatime" ];
				};

				"/home" = {
					device = "/dev/disk/by-uuid/fdfb566d-f74f-4a85-804f-bbc37fb63f01";
					fsType = "btrfs";
					options = [ "subvol=HOME" "compress=zstd" "noatime" ];
				};

				"/swap" = {
					device = "/dev/disk/by-uuid/fdfb566d-f74f-4a85-804f-bbc37fb63f01";
					fsType = "btrfs";
					options = [ "subvol=SWAP" "noatime" ];
				};

				"/boot" = {
					device = "/dev/disk/by-uuid/B475-914E";
					fsType = "vfat";
					options = [ "fmask=0077" "dmask=0077" ];
				};

			};

			swapDevices = [{
				device = "/swap/swapfile";
				size = 16*1024;
			}];

			nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
			hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

		};

}
