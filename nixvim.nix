{ pkgs, ... }:

{
  viAlias = true;
  vimAlias = true;

  # -------------------------
  # Core options
  # -------------------------
  opts = {
    number = true;
    relativenumber = true;
    mouse = "a";
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
    smartindent = true;
    termguicolors = true;
    updatetime = 200;
    signcolumn = "yes";
  };

  globals.mapleader = " ";

  # -------------------------
  # UI / Theme
  # -------------------------
  colorschemes.catppuccin = {
    enable = true;
    settings.flavour = "mocha";
  };

  plugins = {

    # ---------------------
    # Which-key (LazyVim core UX)
    # ---------------------
    which-key.enable = true;

    # ---------------------
    # Telescope
    # ---------------------
    telescope.enable = true;

    # ---------------------
    # File explorer
    # ---------------------
    neo-tree.enable = true;

    # ---------------------
    # Bufferline (tabs)
    # ---------------------
    bufferline.enable = true;

    # ---------------------
    # Statusline
    # ---------------------
    lualine.enable = true;

    # ---------------------
    # Git
    # ---------------------
    gitsigns.enable = true;

    # ---------------------
    # Treesitter
    # ---------------------
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    # ---------------------
    # LSP
    # ---------------------
    lsp = {
      enable = true;

      servers = {
        lua_ls.enable = true;
        pyright.enable = true;

        ts_ls.enable = true;
        html.enable = true;
        cssls.enable = true;

        csharp_ls.enable = true;
        fsautocomplete.enable = true;
        elixirls.enable = true;
      };
    };

    # ---------------------
    # Autocomplete
    # ---------------------
    cmp = {
      enable = true;

      settings = {
        snippet.expand = "luasnip";

        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
        };

        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "path"; }
        ];
      };
    };

    # ---------------------
    # Snippets
    # ---------------------
    luasnip.enable = true;

    # ---------------------
    # Formatting
    # ---------------------
    conform-nvim = {
      enable = true;

      settings.formatters_by_ft = {
        lua = [ "stylua" ];
        python = [ "black" ];
        javascript = [ "prettier" ];
        typescript = [ "prettier" ];
        html = [ "prettier" ];
        css = [ "prettier" ];
        elixir = [ "mix" ];
      };
    };

    # ---------------------
    # Linting
    # ---------------------
    nvim-lint.enable = true;

    # ---------------------
    # Debugging (DAP)
    # ---------------------
    dap.enable = true;
    dap-ui.enable = true;

    # ---------------------
    # Better UI (Noice)
    # ---------------------
    noice.enable = true;

    # ---------------------
    # Notifications
    # ---------------------
    notify.enable = true;

    # ---------------------
    # Better input/select UI
    # ---------------------
    dressing.enable = true;

    # ---------------------
    # Surround, comments, etc.
    # ---------------------
    comment.enable = true;
    nvim-surround.enable = true;
    autopairs.enable = true;
  };

  # -------------------------
  # Keymaps (LazyVim-like)
  # -------------------------
  keymaps = [

    # File
    { key = "<leader>e"; action = "<cmd>Neotree toggle<cr>"; }

    # Telescope
    { key = "<leader>ff"; action = "<cmd>Telescope find_files<cr>"; }
    { key = "<leader>fg"; action = "<cmd>Telescope live_grep<cr>"; }
    { key = "<leader>fb"; action = "<cmd>Telescope buffers<cr>"; }

    # Buffers
    { key = "<S-l>"; action = "<cmd>bnext<cr>"; }
    { key = "<S-h>"; action = "<cmd>bprev<cr>"; }

    # LSP
    { key = "gd"; action = "<cmd>lua vim.lsp.buf.definition()<cr>"; }
    { key = "gr"; action = "<cmd>lua vim.lsp.buf.references()<cr>"; }
    { key = "K"; action = "<cmd>lua vim.lsp.buf.hover()<cr>"; }

    # Format
    { key = "<leader>cf"; action = "<cmd>lua require('conform').format()<cr>"; }

    # Git
    { key = "<leader>gs"; action = "<cmd>Gitsigns preview_hunk<cr>"; }
  ];

  # -------------------------
  # Binaries / Tooling
  # -------------------------
  extraPackages = with pkgs; [
    # LSPs
    lua-language-server
    pyright
    nodePackages.typescript-language-server
    vscode-langservers-extracted
    emmet-ls

    dotnet-sdk
    csharp-ls
    fsautocomplete

    elixir
    elixir_ls

    # Formatters
    stylua
    black
    nodePackages.prettier

    # Debuggers
    delve # (Go example, can extend)
  ];
}