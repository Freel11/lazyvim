-- Define the path to your Global Composer Binaries
-- Based on your logs, this is where they live:
local composer_bin = "C:/Users/jfreel/AppData/Roaming/Composer/vendor/bin"

return {
  -- 1. Mason: STOP installing phpcs/phpcbf here.
  -- We want to use the global ones that have the correct dependencies.
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- "phpcs",  <-- Removed
        -- "phpcbf", <-- Removed
      },
    },
  },

  -- 2. Nvim-Lint: Point to the Composer phpcs
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "phpcs" },
      },
      linters = {
        phpcs = {
          -- cmd needs to be a function or string.
          -- On Windows, Composer usually creates a .bat file.
          cmd = composer_bin .. "/phpcs.bat",
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
          -- Point to the global composer executable
          command = composer_bin .. "/phpcbf.bat",

          prepend_args = { "--standard=WordPress" },
          valid_exit_codes = { 0, 1 },
        },
      },
    },
  },
}
