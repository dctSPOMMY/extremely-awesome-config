{ self, ... }: {

	flake.nixosModules.agenix =

		{ ... }: {

			age.secrets = {

				nix-token = {
					file = "${self}/secrets/nix-token.age";
					owner = "dctspommy";
				};

			};

		};

}
