{ ... }: {

	flake.nixosModules.catppuccin =

		{ ... }: {

			catppuccin = {

				enable = true;

				limine.enable = true;

			};

		};

}
