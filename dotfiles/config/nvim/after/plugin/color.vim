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
    " Tomorrow night colors
    " #1d1f21
    " #282a2e
    " #373b41
    " #969896
    " #b4b7b4
    " #c5c8c6
    " #e0e0e0
    " #ffffff
    " #cc6666
    " #de935f
    " #f0c674
    " #b5bd68
    " #8abeb7
    " #81a2be
    " #b294bb
    " #a3685a
    
    highlight LspDiagnosticsSignError       guifg=#cc6666 guibg=#282c34
    highlight LspDiagnosticsSignHint        guifg=#81a2be guibg=#282c34
    highlight LspDiagnosticsSignInformation guifg=#8abeb7 guibg=#282c34
    highlight LspDiagnosticsSignWarning     guifg=#f0c674 guibg=#282c34
    highlight GitSignsAdd                   guifg=#b5bd68 guibg=#282c34
    highlight GitSignsChange                guifg=#8abeb7 guibg=#282c34
    highlight GitSignsDelete                guifg=#cc6666 guibg=#282c34
  end

