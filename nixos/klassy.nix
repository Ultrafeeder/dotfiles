{
  description = "Klassy, a global theme for KDE plasma with rich customization options. Currently only available in unstable";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {self, nixpkgs, nixpkgs-unstable, ... }@inputs:
   let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
   in  {
      nixosConfigurations = {
        blacktower = lib.nixosSystem {
          inherit system;
          modules = [./configuration.nix];
          specialArgs = { 
            inherit inputs; 
            inherit pkgs;
            inherit pkgs-unstable;
          };
        };
      };
  };
}
