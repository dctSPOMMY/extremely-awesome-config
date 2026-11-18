{ inputs, ... }: {

	flake.homeModules.niri =

		{ ... }:

		let

			niri = inputs.niri.packages."x86_64-linux";

		in {

			programs.niri = {

				enable = true;
				package = niri.niri-unstable;

				settings = {

					hotkey-overlay.skip-at-startup = true;

					prefer-no-csd = true;

					screenshot-path = "~/screenshot_%d.%m.%y_%T.png";

					input = {

						keyboard.xkb = {
							layout = "us,ru";
							options = "grp:win_space_toggle";
						};

						touchpad = {
							tap = true;
							natural-scroll = true;
						};

					};

					layout = {

						focus-ring.active.color = "#7fc8ff";
						insert-hint.display.color = "7fc8ff";

						gaps = 10;

						preset-column-widths = [
							{ proportion = 1. / 3.; }
							{ proportion = 0.5; }
							{ proportion = 2. / 3.; }
							{ proportion = 1.; }
						];

						preset-window-heights = [
							{ proportion = 0.5; }
							{ proportion = 1.; }
						];

						default-column-width.proportion = 0.5;

					};

					binds = {

						"Mod+TouchpadScrollDown".action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.02-" ];
						"Mod+TouchpadScrollUp".action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.02+" "-l" "1.0" ];

						"Mod+Shift+TouchpadScrollDown".action.spawn = [ "brightnessctl" "--class=backlight" "set" "2%-" ];
						"Mod+Shift+TouchpadScrollUp".action.spawn = [ "brightnessctl" "--class=backlight" "set" "+2%" ];

						"Mod+Q".action.spawn = "kitty";
						"Mod+W".action.spawn = "firefox";
						"Mod+R".action.spawn = "fuzzel";

						"Mod+Tab".action.close-window = [ ];
						"Mod+O".action.toggle-overview = [ ];

						"Mod+H".action.focus-column-left = [ ];
						"Mod+L".action.focus-column-right = [ ];
						"Mod+J".action.focus-window-or-workspace-down = [ ];
						"Mod+K".action.focus-window-or-workspace-up = [ ];

						"Mod+Shift+H".action.move-column-left = [ ];
						"Mod+Shift+L".action.move-column-right = [ ];
						"Mod+Shift+J".action.move-window-down-or-to-workspace-down = [ ];
						"Mod+Shift+K".action.move-window-up-or-to-workspace-up = [ ];

						"Mod+Home".action.focus-column-first = [ ];
						"Mod+End".action.focus-column-last = [ ];

						"Mod+Shift+Home".action.move-column-to-first = [ ];
						"Mod+Shift+End".action.move-column-to-last = [ ];

						"Mod+U".action.consume-or-expel-window-left = [ ];
						"Mod+I".action.consume-or-expel-window-right = [ ];

						"Mod+Comma".action.consume-window-into-column = [ ];
						"Mod+Period".action.expel-window-from-column = [ ];

						"Mod+D".action.switch-preset-column-width = [ ];
						"Mod+Shift+D".action.switch-preset-window-height = [ ];

						"Mod+F".action.maximize-column = [ ];
						"Mod+Shift+F".action.fullscreen-window = [ ];

						"Mod+C".action.center-column = [ ];
						"Mod+Shift+C".action.center-visible-columns = [ ];

						"Mod+V".action.switch-focus-between-floating-and-tiling = [ ];
						"Mod+Shift+V".action.toggle-window-floating = [ ];

						"Mod+T".action.toggle-column-tabbed-display = [ ];

						"Print".action.screenshot = [ ];
						"Shift+Print".action.screenshot-screen = [ ];
						"Ctrl+Print".action.screenshot-window = [ ];

						"Mod+Ctrl+Delete".action.quit = [ ];

					};

				};

			};

			home.packages = [ niri.xwayland-satellite-unstable ];

		};

}
