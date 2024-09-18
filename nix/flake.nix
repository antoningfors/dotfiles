{
	description = "My flake description";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.05";
		nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
	};

	outputs = { self, nixpkgs, nixpkgs-unstable, ... }: 
	let
		system = "x86_64-linux";
		lib = nixpkgs.lib;
		pkgs = nixpkgs.legacyPackages.${system};
		pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
	in {
		nixosConfigurations = {
			anton-laptop = lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ ./configuration.nix ];
				specialArgs = {
					inherit pkgs-unstable;
				};
			};
		};
	};
}
