{
  description = "nixos flake";
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-25.11";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ ./configuration.nix ];
      };
    };
}
