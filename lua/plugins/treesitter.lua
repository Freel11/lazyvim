-- In lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- This list will REPLACE the default list, not add to it.
      ensure_installed = {
        "c_sharp", -- from the omnisharp extra
        "typescript", -- from the typescript extra
        "tsx",
        "json",
        "markdown",
        "markdown_inline",
        "toml",
        "css", -- for tailwind
        -- Add any other languages you personally use here
        "lua",
        "bash",
      },
    },
  },
}
