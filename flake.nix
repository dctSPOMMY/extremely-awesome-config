{

	inputs = {

		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim = {
			url = "github:nix-community/nixvim";
			inputs = {
				nixpkgs.follows = "nixpkgs";
				flake-parts.follows = "flake-parts";
				systems.follows = "systems";
			};
		};

		agenix = {
			url = "github:ryantm/agenix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		lidm = {
			url = "github:dctSPOMMY/lidm";
			inputs = {
				nixpkgs.follows = "nixpkgs";
				flake-utils.inputs.systems.follows = "systems";
			};
		};

		niri = {
			url = "github:epireyn/niri-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		catppuccin = {
			url = "github:catppuccin/nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		flake-parts.url = "github:hercules-ci/flake-parts";
		import-tree.url = "github:denful/import-tree";
		systems.url = "github:nix-systems/default";

	};

	outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {

		imports = [
			inputs.home-manager.flakeModules.home-manager
			(inputs.import-tree ./modules)
		];

	};
}
