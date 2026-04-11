return {
  {
    "elixir-tools/elixir-tools.nvim",
    opts = {
      ensure_installed = {
        "elixir",
        "heex",
        "eex",
        "surface",
        "erlang", -- nice bonus for Erlang interop
      },
    },
    version = "*", -- get latest fixes
    ft = { "elixir", "eex", "heex", "surface" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local elixir = require("elixir")

      elixir.setup({
        nextls = { enable = false }, -- disable NextLS entirely
        elixirls = {
          enable = true,
          -- Point directly to the Nix-packaged binary
          cmd = "elixir-ls", -- since it's in PATH now
          -- Optional: better settings
          settings = {
            dialyzerEnabled = true,
            fetchDeps = false,
            enableTestLenses = true,
            suggestSpecs = false,
          },
        },
      })
    end,
  },
}
