{
   inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
      home-manager.url = "github:nix-community/home-manager";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
   };

   outputs = { self, nixpkgs, home-manager }: {
      nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         modules = [
            ./configuration.nix
            ./hardware-configuration.nix
            ./security.nix
            ./services.nix
            ./programs.nix
            ./users.nix
            ./packages.nix
            ./network.nix
            ./home.nix

            home-manager.nixosModules.home-manager
         ];
      };
   };
}
