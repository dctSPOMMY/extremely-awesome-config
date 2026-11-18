{ ... }: {

	flake.homeModules.git =

		{ ... }: {
			
			programs.git = {
				
				enable = true;

				settings.user = {
					name = "dctSPOMMY";
					email = "ilyusha.ko@gmail.com";
				};

			};

			programs.gh.enable = true;

		};

}
