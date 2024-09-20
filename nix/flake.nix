{
	description = "Build entire system";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.05";
		nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, nixpkgs-unstable, ... }: 
	let
		system = "x86_64-linux";
		lib = nixpkgs.lib;
		pkgs = nixpkgs.legacyPackages.${system};
		pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
	in {
		nixosConfigurations = {
			anton-desktop = lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ ./hosts/desktop/configuration.nix ];
				specialArgs = {
					inherit pkgs-unstable;
				};
			};
			anton-laptop = lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ ./hosts/laptop/configuration.nix ];
				specialArgs = {
					inherit pkgs-unstable;
				};
			};
		};
	};
}
