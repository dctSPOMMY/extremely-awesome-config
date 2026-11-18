{ self, inputs, ... }: {
	
	flake.homeConfigurations.dctspommy = inputs.home-manager.lib.homeManagerConfiguration {

		pkgs = import inputs.nixpkgs {
			system = "x86_64-linux";
			config.allowUnfree = true;
		};

		modules = [
			self.homeModules.home
			self.homeModules.programs
			inputs.niri.homeModules.niri
			self.homeModules.niri
			self.homeModules.kitty
			self.homeModules.fish
			self.homeModules.theme
			self.homeModules.git
		];
	
	};

}
