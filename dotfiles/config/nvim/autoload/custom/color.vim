function! custom#color#SetCustom() abort
  if !exists('g:colors_name') | return | endif

  if g:colors_name == 'one'
    highlight Normal       guibg=#20232a
    highlight LineNr       guifg=#696b71 guibg=#282c34
    highlight CursorLineNr guifg=#696b71 guibg=#282c34
    highlight CursorLine   guibg=#282c34
    highlight SignColumn   guibg=#282c34

    highlight LspDiagnosticsSignError       guifg=#e06c75 guibg=#282c34
    highlight LspDiagnosticsSignHint        guifg=#7dcfff guibg=#282c34
    highlight LspDiagnosticsSignInformation guifg=#7aa2f7 guibg=#282c34
    highlight LspDiagnosticsSignWarning     guifg=#e5c07b guibg=#282c34
  elseif g:colors_name == 'base16-tomorrow-night'
    highlight LspDiagnosticsSignError       guifg=#cc6666 guibg=#282c34
    highlight LspDiagnosticsSignHint        guifg=#81a2be guibg=#282c34
    highlight LspDiagnosticsSignInformation guifg=#8abeb7 guibg=#282c34
    highlight LspDiagnosticsSignWarning     guifg=#f0c674 guibg=#282c34
    highlight GitSignsAdd                   guifg=#8abeb7 guibg=#282c34
    highlight GitSignsChange                guifg=#8abeb7 guibg=#282c34
    highlight GitSignsDelete                guifg=#cc6666 guibg=#282c34
  end
endfunction

