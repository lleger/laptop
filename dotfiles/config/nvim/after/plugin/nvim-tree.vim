" https://github.com/kyazdani42/nvim-tree.lua

let g:nvim_tree_side = "right"

let g:nvim_tree_indent_markers = 1

let g:nvim_tree_ignore = [
      \ '.git',
      \ '.elixir_ls',
      \ '_build',
      \ 'deps',
      \ 'node_modules',
      \ ]

let g:nvim_tree_icons = {
      \ 'git': {
      \   'unstaged':  '',
      \   'staged':    '',
      \   'unmerged':  '',
      \   'renamed':   '',
      \   'untracked': '',
      \ },
      \ }

nnoremap <Leader>ee <Cmd>NvimTreeToggle<CR>
nnoremap <leader>er <Cmd>NvimTreeRefresh<CR>
nnoremap <Leader>ef <Cmd>NvimTreeFindFile<CR>
