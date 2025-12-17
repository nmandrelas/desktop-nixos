{ pkgs, lib, ... }:

{
  vim = {

    theme.enable = true;
    theme.name = "catppuccin";
    theme.style = "mocha";
    telescope = {
      enable = true;
    };
    globals.mapleader = " ";
    whichKey.enable = true;
    # You can also enable languages, Treesitter, LSP, etc.
    # vim.languages.nix.enable = true;
    treesitter.enable = true;
    binds.whichKey.enable
  };

}
