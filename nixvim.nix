{ pkgs, ... }:

{
  viAlias = true;
  vimAlias = true;
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

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

  # -------------------------
  # UI / Theme
  # -------------------------
  plugins.web-devicons.enable = true;
  colorschemes.catppuccin = {
    enable = true;

    settings = {
      flavour = "mocha"; # latte, frappe, macchiato, mocha

      transparent_background = false;

      integrations = {
        telescope = true;
        which_key = true;
        gitsigns = true;
        treesitter = true;
        cmp = true;
        notify = true;
        mini = true;
        noice = true;
        neo_tree = true;
        bufferline = true;
      };
    };
  };

  plugins = {

    # ---------------------
    # Which-key (LazyVim core UX)
    # ---------------------
    which-key = {
      enable = true;
      replace = {
        desc = [
          [
            "<space>"
            "SPACE"
          ]
          [
            "<leader>"
            "SPACE"
          ]
          [
            "<[cC][rR]>"
            "RETURN"
          ]
          [
            "<[tT][aA][bB]>"
            "TAB"
          ]
          [
            "<[bB][sS]>"
            "BACKSPACE"
          ]
        ];
      };
      settings = {
        preset = "modern";
        spec = [
          {
            __unkeyed-1 = "<leader>h";
            group = "history";
            icon = "󰄉 ";
          }
          {
            __unkeyed-1 = "<leader>hn";
            desc = "notification history";
          }
          {
            __unkeyed-1 = "<leader>g";
            group = "git";
            icon = " ";
          }
          {
            __unkeyed-1 = "<leader>l";
            group = "lsp";
            icon = "󰒓 ";
          }
          {
            __unkeyed-1 = "<leader>d";
            group = "debug";
            icon = " ";
          }
          {
            __unkeyed-1 = "<leader>t";
            group = "terminal";
            icon = " ";
          }
          {
            __unkeyed-1 = "<leader>b";
            group = "buffer";
            icon = "󰈏 ";
          }
          {
            __unkeyed-1 = "<leader>bn";
            desc = "next buffer";
          }
          {
            __unkeyed-1 = "<leader>bp";
            desc = "prev buffer";
          }
        ];
      };
    };

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
    fugitive.enable = true;

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
        roslyn_ls = {
          enable = true;
          settings = {
            "csharp|background_analysis" = {
              dotnet_analyzer_diagnostics_scope = "fullSolution";
              dotnet_compiler_diagnostics_scope = "fullSolution";
            };
            "csharp|code_lens" = {
              dotnet_enable_references_code_lens = true;
            };
            "csharp|completion" = {
              dotnet_provide_regex_completions = true;
              dotnet_show_completion_items_from_unimported_namespaces = true;
              dotnet_show_name_completion_suggestions = true;
            };
            "csharp|inlay_hints" = {
              csharp_enable_inlay_hints_for_implicit_object_creation = true;
              csharp_enable_inlay_hints_for_implicit_variable_types = true;
              csharp_enable_inlay_hints_for_lambda_parameter_types = true;
              csharp_enable_inlay_hints_for_types = true;
              dotnet_enable_inlay_hints_for_indexer_parameters = true;
              dotnet_enable_inlay_hints_for_literal_parameters = true;
              dotnet_enable_inlay_hints_for_object_creation_parameters = true;
              dotnet_enable_inlay_hints_for_other_parameters = true;
              dotnet_enable_inlay_hints_for_parameters = true;
              dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true;
              dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true;
              dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true;
            };
            "csharp|symbol_search" = {
              dotnet_search_reference_assemblies = true;
            };
          };
        };
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
    # Terminal
    # ---------------------
    toggleterm = {
      enable = true;
      settings = {
        direction = "horizontal";
        size = 10;
        open_mapping = "[[<c-\\>]]";
      };
    };

    # ---------------------
    # Diagnostics
    # ---------------------
    trouble.enable = true;

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
    { key = "<leader>bn"; action = "<cmd>bnext<cr>"; }
    { key = "<leader>bp"; action = "<cmd>bprev<cr>"; }

    # Window navigation
    { key = "<S-h>"; action = "<C-w>h"; }
    { key = "<S-j>"; action = "<C-w>j"; }
    { key = "<S-k>"; action = "<C-w>k"; }
    { key = "<S-l>"; action = "<C-w>l"; }

    # Terminal escape
    { key = "<Esc>"; action = "<C-\\><C-n>"; mode = "t"; }

    # LSP
    { key = "gd"; action = "<cmd>lua vim.lsp.buf.definition()<cr>"; }
    { key = "gr"; action = "<cmd>lua vim.lsp.buf.references()<cr>"; }
    { key = "K"; action = "<cmd>lua vim.lsp.buf.hover()<cr>"; }

    # Format
    { key = "<leader>cf"; action = "<cmd>lua require('conform').format()<cr>"; }

    # Git
    { key = "<leader>gs"; action = "<cmd>Gitsigns preview_hunk<cr>"; }
    { key = "<leader>gg"; action = "<cmd>Git<cr>"; }
    { key = "<leader>gc"; action = "<cmd>Git commit<cr>"; }
    { key = "<leader>gp"; action = "<cmd>Git push<cr>"; }

    # LSP
    { key = "<leader>ld"; action = "<cmd>lua vim.lsp.buf.definition()<cr>"; }
    { key = "<leader>lr"; action = "<cmd>lua vim.lsp.buf.references()<cr>"; }
    { key = "<leader>la"; action = "<cmd>lua vim.lsp.buf.code_action()<cr>"; }
    { key = "<leader>lf"; action = "<cmd>lua vim.lsp.buf.format()<cr>"; }
    { key = "<leader>ln"; action = "<cmd>lua vim.lsp.buf.rename()<cr>"; }

    # Debug
    { key = "<leader>db"; action = "<cmd>lua require('dap').toggle_breakpoint()<cr>"; }
    { key = "<leader>dc"; action = "<cmd>lua require('dap').continue()<cr>"; }
    { key = "<leader>ds"; action = "<cmd>lua require('dap').step_over()<cr>"; }
    { key = "<leader>di"; action = "<cmd>lua require('dap').step_into()<cr>"; }

    # Terminal
    { key = "<leader>tt"; action = "<cmd>ToggleTerm<cr>"; }

    # Search
    { key = "<leader>sf"; action = "<cmd>Telescope find_files<cr>"; }
    { key = "<leader>sg"; action = "<cmd>Telescope live_grep<cr>"; }
    { key = "<leader>sb"; action = "<cmd>Telescope buffers<cr>"; }
    { key = "<leader>sh"; action = "<cmd>Telescope help_tags<cr>"; }

    # Diagnostics
    { key = "<leader>xx"; action = "<cmd>Trouble diagnostics toggle<cr>"; }

    # History
    { key = "<leader>hn"; action = "<cmd>Noice telescope<cr>"; }
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
    roslyn-ls
    fsautocomplete

    elixir
    elixir-ls

    # Formatters
    stylua
    black
    nodePackages.prettier

    # Debuggers
    delve # (Go example, can extend)
  ];
}