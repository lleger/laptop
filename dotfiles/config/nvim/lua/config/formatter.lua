local function bufname() return vim.api.nvim_buf_get_name(0) end
local tempfile_dir = "/tmp"

local formatters = {
  mix_format = {
    function()
      return {
        exe   = "mix",
        args  = {"format"},
        stdin = false,
        tempfile_dir = tempfile_dir
      }
    end
  },
  prettier = {
    function ()
      return {
        exe   = "npx",
        args  = {"prettier", "--stdin-filepath", bufname()},
        stdin = true
      }
    end
  },
}

require("formatter").setup({
  logging = true,
  filetype = {
    elixir     = formatters.mix_format,
    typescript = formatters.prettier,
    javascript = formatters.prettier,
    html       = formatters.prettier,
    eelixir    = formatters.prettier,
    markdown   = formatters.prettier,
    css        = formatters.prettier,
    graphql    = formatters.prettier,
    yaml       = formatters.prettier,
  },
})

local pat = table.concat({
  "*.ex", "*.exs", "*.ts", "*.tsx", "*.js", "*.html", "*.md", "*.markdown",
  ".css", "*.graphql", "*.gql", "*.yaml",
}, ",")

local format = string.format([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost %s FormatWrite
augroup END
]], pat)


vim.api.nvim_exec(format, true)

