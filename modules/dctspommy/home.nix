{ ... }: {

	flake.homeModules.home =

		{ ... }: {

			home.username = "dctspommy";
			home.homeDirectory = "/home/dctspommy";

			programs.home-manager.enable = true;

			home.stateVersion = "26.05";

		};

}
