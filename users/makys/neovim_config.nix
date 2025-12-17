{ pkgs, lib, ... }:

{
  vim = {
    theme.enable = true;
    theme.name = "gruvbox";
    theme.style = "dark";
    # add more NVF options here as needed
  };

  # You can also enable languages, Treesitter, LSP, etc.
  # vim.languages.nix.enable = true;
  # vim.treesitter.enable = true;
}
