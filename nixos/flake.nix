{
  description = "Klassy, a global theme for KDE plasma with rich customization options. Currently only available in unstable";
  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs-unstable, ... }@inputs:
   {
      nixosConfigurations = {
        blacktower = nixpkgs-unstable.lib.nixosSystem rec {
          modules = [
            ./configuration.nix

          ];
          system = "x86_64-linux";
          specialArgs = {
            pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${system};
          };
        };
      };
  };
}
