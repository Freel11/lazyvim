local composer_bin = vim.fn.expand("~/.config/composer/vendor/bin")

return {
  -- 1. Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {},
    },
  },

  -- 2. Nvim-Lint
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "phpcs" },
      },
      linters = {
        phpcs = {
          cmd = composer_bin .. "/phpcs",
          args = {
            "-q",
            "--report=json",
            "--standard=WordPress",
            "-",
          },
        },
      },
    },
  },

  -- 3. Conform
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "phpcbf" },
      },
      formatters = {
        phpcbf = {
          command = composer_bin .. "/phpcbf",
          prepend_args = { "--standard=WordPress" },
          valid_exit_codes = { 0, 1 },
        },
      },
    },
  },

  -- 4. LSP Config: Intelephense yes, phpactor no
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
