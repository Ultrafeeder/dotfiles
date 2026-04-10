{
  description = "Main flake for system build";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {self, nixpkgs, ... }@inputs:
   {
      nixosConfigurations = {
        blacktower = nixpkgs.lib.nixosSystem {
          modules = [
            ./configuration.nix
          ];
          specialArgs = {inherit inputs;};
          system = "x86_64-linux";
        };
      };
  };
}
