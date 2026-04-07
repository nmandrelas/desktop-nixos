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
          {
            __unkeyed-1 = "<leader>c";
            group = "code";
            icon = "󰘦 ";
          }
          {
            __unkeyed-1 = "<leader>cf";
            desc = "format";
          }
          {
            __unkeyed-1 = "<leader>d";
            group = "debug";
            icon = " ";
          }
          {
            __unkeyed-1 = "<leader>db";
            desc = "toggle breakpoint";
          }
          {
            __unkeyed-1 = "<leader>dc";
            desc = "Launch/continue";
          }
          {
            __unkeyed-1 = "<leader>di";
            desc = "step into";
          }
          {
            __unkeyed-1 = "<leader>do";
            desc = "step out";
          }
          {
            __unkeyed-1 = "<leader>dr";
            desc = "dap repl";
          }
          {
            __unkeyed-1 = "<leader>ds";
            desc = "step over";
          }
          {
            __unkeyed-1 = "<leader>du";
            desc = "toggle dap ui";
          }
          {
            __unkeyed-1 = "<leader>g";
            group = "git";
            icon = " ";
          }
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
            __unkeyed-1 = "<leader>hu";
            desc = "undo tree";
          }
          {
            __unkeyed-1 = "<leader>l";
            group = "lsp";
            icon = "󰒓 ";
          }
          {
            __unkeyed-1 = "<leader>m";
            group = "marks";
            icon = " ";
          }
          {
            __unkeyed-1 = "<leader>m1";
            desc = "harpoon file 1";
          }
          {
            __unkeyed-1 = "<leader>m2";
            desc = "harpoon file 2";
          }
          {
            __unkeyed-1 = "<leader>m3";
            desc = "harpoon file 3";
          }
          {
            __unkeyed-1 = "<leader>m4";
            desc = "harpoon file 4";
          }
          {
            __unkeyed-1 = "<leader>ma";
            desc = "harpoon add";
          }
          {
            __unkeyed-1 = "<leader>mm";
            desc = "harpoon menu";
          }
          {
            __unkeyed-1 = "<leader>mn";
            desc = "harpoon next";
          }
          {
            __unkeyed-1 = "<leader>mp";
            desc = "harpoon prev";
          }
          {
            __unkeyed-1 = "<leader>t";
            group = "test";
            icon = "󰙨 ";
          }
          {
            __unkeyed-1 = "<leader>tt";
            desc = "run nearest";
          }
          {
            __unkeyed-1 = "<leader>tf";
            desc = "run file";
          }
          {
            __unkeyed-1 = "<leader>ts";
            desc = "summary";
          }
          {
            __unkeyed-1 = "<leader>td";
            desc = "debug nearest";
          }
          {
            __unkeyed-1 = "<leader>T";
            group = "terminal";
            icon = " ";
          }
          {
            __unkeyed-1 = "<leader>Tt";
            desc = "Toggle Terminal";
          }
          {
            __unkeyed-1 = "<leader>w";
            group = "window";
            icon = "󰙯 ";
          }
          {
            __unkeyed-1 = "<leader>x";
            group = "todo";
            icon = " ";
          }
          {
            __unkeyed-1 = "<leader>xt";
            desc = "todo telescope";
          }
          {
            __unkeyed-1 = "<leader>xo";
            desc = "todo quickfix";
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
        gopls.enable = true;
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

      settings = {
        lsp_format = "fallback";

        formatters_by_ft = {
          css = [ "prettier" ];
          elixir = [ "mix" ];
          html = [ "prettier" ];
          javascript = [ "prettier" ];
          lua = [ "stylua" ];
          python = [ "black" ];
          typescript = [ "prettier" ];
        };

        formatters = {
          dotnet = {
            command = "dotnet";
            args = [ "format" "--stdin-filepath=$FILENAME" ];
            stdin = true;
          };
        };
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
    dap-virtual-text.enable = true;
    dap-ui.enable = true;
    dap-go.enable = true;

    # ---------------------
    # Harpoon
    # ---------------------
    harpoon = {
      enable = true;
      enableTelescope = true;
      autoLoad = true;
    };

    # ---------------------
    # Todo Comments
    # ---------------------
    todo-comments.enable = true;

    # ---------------------
    # Testing (Neotest)
    # ---------------------
    neotest = {
      enable = true;
      adapters.dotnet.enable = true;
    };

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
    undotree.enable = true;

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

    # File & Search
    { key = "<leader>e"; action = "<cmd>Neotree toggle<cr>"; }
    { key = "<leader>ff"; action = "<cmd>Telescope find_files<cr>"; }
    { key = "<leader>fg"; action = "<cmd>Telescope live_grep<cr>"; }
    { key = "<leader>fb"; action = "<cmd>Telescope buffers<cr>"; }
    { key = "<leader>fh"; action = "<cmd>Telescope help_tags<cr>"; }

    # Buffers
    { key = "<leader>bn"; action = "<cmd>bnext<cr>"; }
    { key = "<leader>bp"; action = "<cmd>bprev<cr>"; }
    { key = "<S-h>"; action = "<cmd>bprev<cr>"; }
    { key = "<S-l>"; action = "<cmd>bnext<cr>"; }

    # Window navigation
    { key = "<C-h>"; action = "<C-w>h"; }
    { key = "<C-j>"; action = "<C-w>j"; }
    { key = "<C-k>"; action = "<C-w>k"; }
    { key = "<C-l>"; action = "<C-w>l"; }

    # Terminal escape
    { key = "<Esc>"; action = "<C-\\><C-n>"; mode = "t"; }

    # LSP
    { key = "gd"; action = "<cmd>lua vim.lsp.buf.definition()<cr>"; }
    { key = "gr"; action = "<cmd>lua vim.lsp.buf.references()<cr>"; }
    { key = "K"; action = "<cmd>lua vim.lsp.buf.hover()<cr>"; }

    # Format
    { key = "<leader>cf"; action = "<cmd>lua vim.lsp.buf.format()<cr>"; }

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
    { key = "<leader>do"; action = "<cmd>lua require('dap').step_out()<cr>"; }
    { key = "<leader>dr"; action = "<cmd>lua require('dap').repl.open()<cr>"; }
    { key = "<leader>du"; action = "<cmd>lua require('dapui').toggle()<cr>"; }

    # Test
    { key = "<leader>tf"; action = "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>"; }
    { key = "<leader>ts"; action = "<cmd>lua require('neotest').summary.toggle()<cr>"; }
    { key = "<leader>td"; action = "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>"; }

    # Terminal
    { key = "<leader>Tt"; action = "<cmd>ToggleTerm<cr>"; }

    # Harpoon
    { key = "<leader>ma"; action = "<cmd>lua require('harpoon'):list():add()<cr>"; }
    { key = "<leader>mm"; action = "<cmd>lua require('harpoon'):list():select()<cr>"; }
    { key = "<leader>mn"; action = "<cmd>lua require('harpoon'):list():next()<cr>"; }
    { key = "<leader>mp"; action = "<cmd>lua require('harpoon'):list():prev()<cr>"; }
    { key = "<leader>m1"; action = "<cmd>lua require('harpoon'):list():select(1)<cr>"; }
    { key = "<leader>m2"; action = "<cmd>lua require('harpoon'):list():select(2)<cr>"; }
    { key = "<leader>m3"; action = "<cmd>lua require('harpoon'):list():select(3)<cr>"; }
    { key = "<leader>m4"; action = "<cmd>lua require('harpoon'):list():select(4)<cr>"; }

    # Todo comments
    { key = "<leader>xt"; action = "<cmd>TodoTelescope<cr>"; }
    { key = "<leader>xo"; action = "<cmd>TodoQuickFix<cr>"; }


    # Window commands
    { key = "<leader>-"; action = "<cmd>split<cr>"; }
    { key = "<leader>|"; action = "<cmd>vsplit<cr>"; }
    { key = "<leader>wd"; action = "<cmd>close<cr>"; }

    # Diagnostics
    { key = "<leader>xx"; action = "<cmd>Trouble diagnostics toggle<cr>"; }

    # History
    { key = "<leader>hn"; action = "<cmd>Noice telescope<cr>"; }
    { key = "<leader>hu"; action = "<cmd>UndotreeToggle<cr>"; }
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
    netcoredbg
    delve # (Go example, can extend)
  ];
}