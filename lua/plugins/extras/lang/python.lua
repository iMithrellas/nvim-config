local util = require("util")

return {

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
      },
      setup = {
        pyright = function(_, opts)
          local function on_attach(client, buffer)
            -- Add any specific code for pyright here
          end

          local pyright_config = vim.tbl_deep_extend("force", opts, {
            on_attach = on_attach,
            settings = {
              python = {
                analysis = {
                  reportLongLines = { enabled = true, limit = 240 },
                },
              },
            },
          })

          require("lspconfig").pyright.setup(pyright_config)
          return true
        end,
      },
    },
  },
  -- Add Python to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        util.list_insert_unique(opts.ensure_installed, "python")
      end
    end,
  },

  -- Ensure Python debugging is installed
  {
    "mfussenegger/nvim-dap",
    opts = function(_, opts)
      -- Add custom configuration or plugins dependent on nvim-dap if necessary
    end,
  },

  -- Correctly setup lspconfig for Python
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pylsp = {},
      },
      setup = {
        pylsp = function(_, opts)
          local function on_attach(client, buffer)
            -- Add any specific code for pylsp here
          end

          -- Custom keymaps for Python functionality
          vim.api.nvim_create_autocmd("FileType", {
            pattern = "python",
            callback = function()
              -- Add specific functionality, like auto-import, linting, etc.
            end,
          })

          local pylsp_config = vim.tbl_deep_extend("force", opts, {
            on_attach = on_attach,
            settings = {
              pylsp = {
                plugins = {
                  pylint = { enabled = true },
                  pyflakes = { enabled = true },
                  -- Add more plugins and settings here
                },
              },
            },
          })

          require("lspconfig").pylsp.setup(pylsp_config)
          return true
        end,
      },
    },
  },
}
