{ ... }: {

	flake.homeModules.fish =

		{ ... }: {
			
			programs.fish = {
				
				enable = true;

				interactiveShellInit = ''
					set fish_greeting
				'';

			};

		};

}

				
