{
   inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
      home-manager.url = "github:nix-community/home-manager?ref=release-25.05";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
   };

   outputs = { self, nixpkgs, home-manager }:
   let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
   in {
      nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
         inherit system;
         modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
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
