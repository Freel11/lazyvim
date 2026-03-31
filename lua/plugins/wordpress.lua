-- Helper function to prefer project-local binaries over global ones
local function get_binary_path(bin_name)
  local local_bin = vim.fn.getcwd() .. "/vendor/bin/" .. bin_name
  if vim.fn.executable(local_bin) == 1 then
    return local_bin
  end
  return vim.fn.expand("~/.config/composer/vendor/bin/" .. bin_name)
end

return {
  -- 1. Mason: STOP installing PHP tools here.
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {},
    },
  },

  -- 2. Nvim-Lint: Point to local/global binaries
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "phpcs", "phpmd", "phpstan" },
      },
      linters = {
        phpcs = {
          cmd = function()
            return get_binary_path("phpcs")
          end,
        },
        phpmd = {
          cmd = function()
            return get_binary_path("phpmd")
          end,
        },
        phpstan = {
          cmd = function()
            return get_binary_path("phpstan")
          end,
        },
      },
    },
  },

  -- 3. Conform: Point to the Composer phpcbf
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "phpcbf" },
      },
      formatters = {
        phpcbf = {
          command = function()
            return get_binary_path("phpcbf")
          end,
          valid_exit_codes = { 0, 1 },
        },
      },
    },
  },

  -- 4. LSP Config: Configure Intelephense to read ACF Stubs
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = false,
        intelephense = {
          settings = {
            intelephense = {
              environment = {
                includePaths = {
                  vim.fn.expand("~/.config/composer/vendor/php-stubs/acf-pro-stubs"),
                },
              },
            },
          },
        },
      },
    },
  },
}
