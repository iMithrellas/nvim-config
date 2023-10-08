return {
  {
    "gorbit99/codewindow.nvim",
    enabled = false,
    event = "BufReadPre",
    keys = {
			-- stylua: ignore
			{ "<leader>um", function() require("codewindow").toggle_minimap() end, desc = "Toggle Minimap" },
    },
    config = function()
      require("codewindow").setup({
        z_index = 25,
        auto_enable = true,
        exclude_filetypes = {
          "alpha",
          "dap-terminal",
          "DiffviewFiles",
          "git",
          "gitcommit",
          "help",
          "lazy",
          "lspinfo",
          "mason",
          "NeogitCommitMessage",
          "NeogitStatus",
          "neotest-summary",
          "neo-tree",
          "neo-tree-popup",
          "noice",
          "Outline",
          "qf",
          "spectre_panel",
          "toggleterm",
          "Trouble",
        },
      })
    end,
  },

  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = { { "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "UndoTree Toggle" } },
    config = function()
      vim.g.undotree_TreeNodeShape = "◦" -- Alternative: '◉'
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },
}
