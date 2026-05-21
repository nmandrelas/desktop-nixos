return {
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
    },
    cmd = "UndotreeToggle",
    config = function()
      -- Optional: nice default settings
      vim.g.undotree_WindowLayout = 2 -- layout style
      vim.g.undotree_ShortIndicators = 1 -- use short time indicators (d, h, m, s)
      vim.g.undotree_SetFocusWhenToggle = 1 -- focus the undotree window when opened
      vim.g.undotree_HelpLine = 0 -- hide help line if you want
    end,
  },
}
