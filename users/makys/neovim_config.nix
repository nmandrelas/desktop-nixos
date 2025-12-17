{ pkgs, lib, ... }:

{
  vim = {
    theme.enable = true;
    theme.name = "catppuccin";
    theme.style = "mocha";
    # add more NVF options here as needed
  };

  # You can also enable languages, Treesitter, LSP, etc.
  # vim.languages.nix.enable = true;
  # vim.treesitter.enable = true;
}
