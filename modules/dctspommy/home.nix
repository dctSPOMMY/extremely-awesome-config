{ ... }: {

	flake.homeModules.home =

		{ ... }: {

			home.username = "dctspommy";
			home.homeDirectory = "/home/dctspommy";

			dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

			programs.home-manager.enable = true;

			home.stateVersion = "26.05";

		};

}
