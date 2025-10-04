{
	description = "Build entire system";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.05";
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
		pkgs = import nixpkgs {system = "x86_64-linux"; config.allowUnfree = true;};
		pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
	in {
		nixosConfigurations = {
			anton-desktop = lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ 
						./hosts/desktop/configuration.nix 
						./modules/nixos/nvidia.nix
					];
				specialArgs = {
					inherit pkgs-unstable;
					inherit pkgs;
				};
			};
			anton-laptop = lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ ./hosts/laptop/configuration.nix ];
				specialArgs = {
					inherit pkgs-unstable;
					inherit pkgs;
				};
			};
		};
	};
}
