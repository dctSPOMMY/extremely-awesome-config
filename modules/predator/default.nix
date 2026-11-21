{ self, inputs, ... }: {

	flake.nixosConfigurations.predator = inputs.nixpkgs.lib.nixosSystem {

		modules = [
			inputs.agenix.nixosModules.default
			inputs.lidm.nixosModules.lidm
			self.nixosModules.hardware-configuration
			self.nixosModules.configuration
			self.nixosModules.programs
			inputs.nixvim.nixosModules.nixvim
			self.nixosModules.nixvim
			inputs.catppuccin.nixosModules.catppuccin
			self.nixosModules.catppuccin
			self.nixosModules.ollama
			self.nixosModules.agenix
			self.nixosModules.zapret
		];

	};

}
