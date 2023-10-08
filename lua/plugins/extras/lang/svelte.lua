local util = require("util")
return {
  -- Extend auto-completion with nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        -- Add Svelte specific sources here if any
      }))
    end,
  },

  -- Add Svelte to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        util.list_insert_unique(opts.ensure_installed, { "svelte" })
      end
    end,
  },

  -- Use Mason to manage LSP servers and other dependencies
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        util.list_insert_unique(opts.ensure_installed, { "svelte-language-server" })
      end
    end,
  },

  -- Formatting setup
  {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup({
        filetype = {
          svelte = {
            -- prettier for HTML, CSS, Tailwind CSS
            function()
              return {
                exe = "prettier",
                args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
                stdin = true,
              }
            end,
          },
        },
      })
    end,
  },
}
