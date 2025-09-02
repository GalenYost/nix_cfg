let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
   inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
   };

   outputs = { self, nixpkgs }: {
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
            (import "${home-manager}/nixos")
         ];
      };
   };
}

