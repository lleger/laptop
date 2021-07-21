-- Enable 24-bit color
 vim.o.termguicolors = true

--- Package management
vim.cmd("packadd paq-nvim")
local paq = require("paq-nvim").paq
paq {"savq/paq-nvim", opt = true}

paq "HerringtonDarkholme/yats.vim"
paq "JoosepAlviste/nvim-ts-context-commentstring"
paq "MaxMEllon/vim-jsx-pretty"
paq "andymass/vim-matchup"
paq "b3nj5m1n/kommentary"
paq "cespare/vim-toml"
paq "chriskempson/base16-vim"
paq "editorconfig/editorconfig-vim"
paq "elixir-editors/vim-elixir"
paq "ericpruitt/tmux.vim"
paq "euclidianAce/BetterLua.vim"
paq "folke/todo-comments.nvim"
paq "folke/trouble.nvim"
paq "folke/which-key.nvim"
paq "hashivim/vim-terraform"
paq "hrsh7th/nvim-compe"
paq "hrsh7th/vim-vsnip"
paq "hrsh7th/vim-vsnip-integ"
paq "itchyny/lightline.vim"
paq "janko/vim-test"
paq "jparise/vim-graphql"
paq "justinmk/vim-sneak"
paq "kyazdani42/nvim-tree.lua"
paq "kyazdani42/nvim-web-devicons"
paq "lewis6991/gitsigns.nvim"
paq "mhartington/formatter.nvim"
paq "neovim/nvim-lspconfig"
paq "norcalli/nvim-colorizer.lua"
paq "nvim-lua/lsp-status.nvim"
paq "nvim-lua/plenary.nvim"
paq "nvim-lua/popup.nvim"
paq "nvim-telescope/telescope.nvim"
paq "onsails/lspkind-nvim"
paq "othree/html5.vim"
paq "pangloss/vim-javascript"
paq "plasticboy/vim-markdown"
paq "romgrk/barbar.nvim"
paq "taniarascia/new-moon.vim"
paq "tpope/vim-eunuch"
paq "tpope/vim-fugitive"
paq "tpope/vim-repeat"
paq "tpope/vim-sleuth"
paq "tpope/vim-speeddating"
paq "tpope/vim-surround"
paq "tpope/vim-unimpaired"
paq "voldikss/vim-floaterm"
paq "windwp/nvim-autopairs"
paq "windwp/nvim-ts-autotag"
paq {"nvim-telescope/telescope-fzy-native.nvim", run = "git submodule update --init --recursive"}
paq {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

require("config.autopairs")
require("config.colorizer")
require("config.compe")
require("config.formatter")
require("config.gitsigns")
require("config.kommentary")
require("config.lspconfig")
require("config.lspkind")
require("config.telescope")
require("config.todo-comments")
require("config.treesitter")
require("config.trouble")
require("config.which-key")
