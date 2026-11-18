{ self, inputs, ... }: {

	flake.nixosConfigurations.predator = inputs.nixpkgs.lib.nixosSystem {

		modules = [
			self.nixosModules.hardware-configuration
			self.nixosModules.configuration
			self.nixosModules.programs
			inputs.nixvim.nixosModules.nixvim
			self.nixosModules.nixvim
			self.nixosModules.ollama
			inputs.agenix.nixosModules.default
			self.nixosModules.agenix
			self.nixosModules.zapret
		];

	};

}
