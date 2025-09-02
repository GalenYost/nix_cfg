{
   inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
      home-manager.url = "github:nix-community/home-manager?ref=release-25.05";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
   };

   outputs = { self, nixpkgs, home-manager }: {
      nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
         ];
      };

      homeConfigurations = {
         user = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            modules = [ ./home.nix ];
         };
      };
   };
}
