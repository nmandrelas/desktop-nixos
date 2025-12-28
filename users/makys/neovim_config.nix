{ pkgs, lib, ... }:

{
  vim = {
    theme.enable = true;
    theme.name = "catppuccin";
    theme.style = "mocha";
    telescope = { enable = true; };
    globals.mapleader = " ";
    autocomplete.nvim-cmp.enable = true;
    # You can also enable languages, Treesitter, LSP, etc.
    # vim.languages.nix.enable = true;
    languages = {
      elixir = {
        enable = true;
        elixir-tools.enable = true;
        treesitter.enable = true;
        format.enable = true;
        lsp.enable = true;
      };
    };
    filetree.nvimTree.enable = true;
    diagnostics = {
      enable = true;
      config = {
        virtualText = true;   # inline error text
        underline = true;     # underline errors
        updateInInsert = false;
      };
    };
    git = {
      enable = true;
      gitsigns = {
        enable = true;
      };
    };
    treesitter.enable = true;
    binds.whichKey.enable = true;
    utility.undotree.enable = true;
    lsp.trouble.enable = true;
    keymaps = [
      {
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
        desc = "Scroll down and center";
      }
      {
        key = "<C-u>";
        mode = "n";
        silent = true;
        action = "<C-u>zz";
        desc = "Scroll up and center";
      }
      {
        key = "n";
        mode = "n";
        silent = true;
        action = "nzzzv";
        desc = "Find and center";
      }
      {
        key = "N";
        mode = "n";
        silent = true;
        action = "Nzzzv";
        desc = "Find and center";
      }
      {
        key = "<leader>p";
        mode = "x";
        silent = true;
        action = ''"_dP'';
        desc = "Paste without overwriting clipboard";
      }
      {
        key = "<leader>e";
        mode = "n";
        silent = true;
        action = ":lua vim.diagnostic.open_float()<CR>";
        desc = "Show diagnostics under cursor";
      }
      {
        key = "[d";
        mode = "n";
        silent = true;
        action = ":lua vim.diagnostic.goto_prev()<CR>";
        desc = "Previous diagnostic";
      }
      {
        key = "]d";
        mode = "n";
        silent = true;
        action = ":lua vim.diagnostic.goto_next()<CR>";
        desc = "Next diagnostic";
      }
      {
        key = "<C-S-f>";
        mode = "n";
        silent = true;
        action = ":lua vim.lsp.buf.format()<CR>";
        desc = "Format document";
      }
      {
        key = "<leader>e";
        mode = "n";
        silent = true;
        action = ":NvimTreeToggle<CR>";
        desc = "Toggle file tree";
      }
    ];
  };
}
