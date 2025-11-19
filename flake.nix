{
   inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      home-manager.url = "github:nix-community/home-manager";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
   };

   outputs = { self, nixpkgs, home-manager, neovim-nightly-overlay }:
   let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      overlays = [
        neovim-nightly-overlay.overlays.default
      ];
   in {
      nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
         inherit system;
         modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {
              nixpkgs.overlays = overlays;
            }
         ];
      };

      homeConfigurations = {
         user = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
               ./home.nix
            ];
         };
      };
   };
}
