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

    # You can also enable languages, Treesitter, LSP, etc.
    # vim.languages.nix.enable = true;
    vim.treesitter.enable = true;
  };

}
