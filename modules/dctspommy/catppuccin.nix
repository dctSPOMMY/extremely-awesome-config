{ ... }: {

	flake.homeModules.catppuccin =

		{ ... }: {

			catppuccin = {

				enable = true;
				flavour = "mocha";
				accent = "mauve";

				cursors = {
					enable = true;
					accent = "dark";
				};

				fish.enable = true;
				kitty.enable = true;
				fuzzel.enable = true;
				qt5ct.enable = true;
				firefox.enable = true;
				mpv.enable = true;

			};

		};

}
