{
  description = "nixos flake";
  inputs = { nixpkgs =  { url = "github:nixos/nixpkgs/nixos-25.11"; }; };
  outputs = {self, nixpkgs, ...}@inputs: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [ ./configuration.nix ];
    };
  };
}
