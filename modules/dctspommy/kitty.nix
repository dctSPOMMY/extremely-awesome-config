{ ... }: {

	flake.homeModules.kitty =

		{ ... }: {

			programs.kitty = {
				
				enable = true;

				shellIntegration.enableFishIntegration = true;

				font = {
					name = "FiraCode NF";
					size = 12.0;
				};

				themeFile = "Catppuccin-Mocha";

				settings = {
					
					font_features = "FiraCodeNF-Reg +cv01 +cv02 +cv10 +cv17 +ss01 +ss04 +ss08";

					cursor_trail = 1;
					cursor_trail_start_threshold = 0;

					tab_bar_min_tabs = 1;
					tab_bar_style = "powerline";
					tab_powerline_style = "slanted";

					window_padding_width = 10;
					notify_on_cmd_finish = "invisible";
					confirm_os_window_close = 0;

				};

			};
		
		};

}
