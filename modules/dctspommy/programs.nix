{ ... }: {

	flake.homeModules.programs =

		{ pkgs, ... }: {

			programs.fuzzel.enable = true;
			programs.firefox.enable = true;
			programs.discord.enable = true;

			home.packages = with pkgs; [
				(python3.withPackages (p: with p; [
					numpy
					requests
					fastapi
					uvicorn
					websockets
					sqlalchemy
					asyncpg
					pwdlib
					argon2-cffi
					pyjwt
				]))
				ruff
				telegram-desktop
				prismlauncher
				mpv
				piper
				openrgb
				brightnessctl
				nerd-fonts.fira-code
			];

		};

}
