{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
        aagl.url = "github:ezKEa/aagl-gtk-on-nix";
        aagl.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = {
        self,
        nixpkgs,
        home-manager,
        neovim-nightly-overlay,
        aagl,
    }: let
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
                {
                    imports = [aagl.nixosModules.default];
                    nix.settings = aagl.nixConfig;
                    programs.anime-game-launcher.enable = true;
                    programs.honkers-railway-launcher.enable = true;
                }
            ];
        };

        homeConfigurations = {
            user = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    {
                        nixpkgs.overlays = overlays;
                        nixpkgs.config.allowUnfree = true;
                    }
                    ./home/user/home.nix
                ];
            };
        };
    };
}
