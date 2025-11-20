return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "phpcs",
        "phpcbf",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "phpcs" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "phpcbf" },
      },
      formatters = {
        phpcbf = {
          prepend_args = { "--standard=WordPress" },
        },
      },
    },
  },
}
