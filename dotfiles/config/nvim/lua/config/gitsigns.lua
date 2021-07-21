require("gitsigns").setup({
  signs = {
    add          = {text= "┃", hl = "GitSignsAdd"   },
    change       = {text= "┃", hl = "GitSignsChange"},
    delete       = {text= "_", hl = "GitSignsDelete"},
    topdelete    = {text= "‾", hl = "GitSignsDelete"},
    changedelete = {text= "~", hl = "GitSignsChange"},
  }
})
