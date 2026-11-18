{ ... }: {

	flake.nixosModules.programs =

		{ pkgs, ... }: {

			programs = {
				dconf.enable = true;
				git.enable = true;
				fish.enable = true;
				steam.enable = true;
				obs-studio.enable = true;
				throne = {
					enable = true;
					tunMode.enable = true;
				};
			};

			environment.systemPackages = with pkgs; [
				r2modman
				qbittorrent
			];

		};

}
