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
    treesitter.enable = true;
    binds.whichKey.enable = true;
    utility.undotree.enable = true;
    keymaps = [{
      key = "<leader>u";
      mode = "n";
      silent = true;
      action = ":UndotreeToggle<CR>";
      desc = "show undotree";
    }
    {
      key = "<C-d>";
      mode = "n";
      silent = true;
      action = "<C-d>zz";
      desc = "show undotree";
    }
    ];

  };

}
