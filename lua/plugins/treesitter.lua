-- In lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c_sharp",
        "typescript",
        "tsx",
        "json",
        "markdown",
        "markdown_inline",
        "toml",
        "css",
        "lua",
        "bash",
        "html",
        "python",
        "php",
      },
    },
  },
}
