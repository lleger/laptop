require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua", 
    "typescript",
    "css",
    "dockerfile",
    "elixir",
    "erlang",
    "graphql",
    "javascript",
    "regex",
    "toml",
    "typescript",
    "yaml",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false
  }
})
