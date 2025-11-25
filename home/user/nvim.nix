{
    config,
    pkgs,
    lib,
    ...
}: {
    programs.neovim = {
        enable = true;
        package = pkgs.neovim;
        viAlias = true;
        vimAlias = true;
        defaultEditor = true;
        plugins = with pkgs.vimPlugins; [
            nvim-treesitter
            blink-cmp
            tiny-inline-diagnostic-nvim
            mini-nvim
            fyler-nvim
            tokyonight-nvim
        ];
        extraPackages = with pkgs; [
            # fmt
            alejandra

            # lsp
            lua-language-server
            vscode-langservers-extracted
            zls
            nil
        ];
        extraLuaConfig = builtins.readFile ./nvim_init.lua;
    };
}
