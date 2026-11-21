{ ... }: {

	flake.nixosModules.configuration =

		{ config, pkgs, ... }: {

			networking.hostName = "predator";

			nix.settings.experimental-features = [ "nix-command" "flakes" ];
			nix.extraOptions = "!include ${config.age.secrets.nix-token.path}";

			nixpkgs.config.allowUnfree = true;

			users.users.dctspommy = {
				isNormalUser = true;
				extraGroups = [ "wheel" "audio" "video" "input" "networkmanager" ];
				shell = pkgs.fish;
			};

			boot.loader = {
				limine = {
					enable = true;
					efiSupport = true;
					maxGenerations = 10;
				};
				efi.canTouchEfiVariables = true;
			};

			services.displayManager.enable = true;
			systemd.services.lidm.enable = true;
			services.lidm.config = "catppuccin-mocha";

			services.pipewire = {
				enable = true;
				pulse.enable = true;
				alsa.enable = true;
				alsa.support32Bit = true;
				wireplumber.enable = true;
			};

			services.hardware.openrgb.enable = true;

			hardware.graphics.enable = true;
			services.xserver.videoDrivers = [ "modesetting" "nvidia" ];
			hardware.nvidia = {
				open = true;
				modesetting.enable = true;
				powerManagement.enable = true;
				prime = {
					offload = {
						enable = true;
						enableOffloadCmd = true;
					};
					intelBusId = "PCI:0@0:2:0";
					nvidiaBusId = "PCI:1@0:0:0";
				};
			};

			xdg.portal = {
				enable = true;
				extraPortals = with pkgs; [
					xdg-desktop-portal-gnome
					xdg-desktop-portal-gtk
				];
				config.common.default = "*";
			};

			console.useXkbConfig = true;
			services.xserver.xkb = {
				layout = "us,ru";
				options = "grp:win_space_toggle";
			};

			services.libinput.enable = true;

			services.ratbagd.enable = true;

			environment.etc."libinput/local-overrides.quirks".text = ''
				[Never Debounce Generic]
				MatchUdevType=mouse
				ModelBouncingKeys=1
			'';

			networking.networkmanager.enable = true;

			services.openssh.enable = true;

			services.postgresql.enable = true;

			services.printing = {
				enable = true;
				drivers = [ pkgs.splix ];
			};

			time.timeZone = "Europe/Moscow";

			system.stateVersion = "25.11";

		};

}
