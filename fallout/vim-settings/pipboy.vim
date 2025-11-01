" pipboy.vim — Fallout / Pip-Boy inspired Vim colorscheme
" Subtle green variants for readability, transparent background to show terminal wallpaper.

if exists("g:colors_name")
  finish
endif
set background=dark
let g:colors_name = "pipboy"

" ===== Palette (GUI hex) =====
let s:bg_none = ""          " transparent
let s:fg_base = "#00ff00"   " primary green
let s:fg_dim  = "#228822"   " comments / subtle
let s:fg_brt  = "#66ff66"   " bright lime
let s:fg_mint = "#a8ffb0"   " strings (mint)
let s:fg_yg   = "#ccff66"   " numbers / constants (yellow-green)
let s:fg_teal = "#00ff88"   " keywords / statements (green-teal)
let s:fg_olive= "#99cc66"   " types (amber-green)
let s:line    = "#003300"   " cursorline / columns
let s:sel     = "#004400"   " visual/popup bg
let s:cur     = "#66ff66"   " cursor

" ===== Approx cterm fallbacks (256-color) =====
"  0:black  2:green  10:bright green  22/28:dark greens  82:lime  120:minty
let s_ct_fg      = "10"
let s_ct_dim     = "28"
let s_ct_bright  = "10"
let s_ct_mint    = "120"
let s_ct_yg      = "190"
let s_ct_teal    = "48"
let s_ct_olive   = "149"
let s_ct_linebg  = "22"
let s_ct_selbg   = "22"

" ===== Helper =====
function! s:HL(group, fg, bg, attr, ctermfg, ctermbg)
  execute "hi " . a:group
        \ . (a:fg      != "" ? " guifg=" . a:fg      : "")
        \ . (a:bg      != "" ? " guibg=" . a:bg      : "")
        \ . (a:attr    != "" ? " gui="   . a:attr    : "")
        \ . (a:ctermfg != "" ? " ctermfg=". a:ctermfg: "")
        \ . (a:ctermbg != "" ? " ctermbg=". a:ctermbg: "")
        \ . (a:attr    != "" ? " cterm=" . a:attr    : "")
endfunction

" ===== Core UI (transparent where possible) =====
call s:HL("Normal",       s:fg_base, s:bg_none, "",      s_ct_fg,     "")
call s:HL("NonText",      s:fg_dim,  s:bg_none, "",      s_ct_dim,    "")
call s:HL("SpecialKey",   s:fg_dim,  s:bg_none, "",      s_ct_dim,    "")
call s:HL("LineNr",       s:fg_dim,  s:bg_none, "",      s_ct_dim,    "")
call s:HL("CursorLineNr", s:fg_brt,  s:bg_none, "bold",  s_ct_fg,     "")
call s:HL("SignColumn",   s:fg_dim,  s:bg_none, "",      s_ct_dim,    "")
call s:HL("VertSplit",    s:fg_dim,  s:bg_none, "",      s_ct_dim,    "")
call s:HL("EndOfBuffer",  s:fg_dim,  s:bg_none, "",      s_ct_dim,    "")

" keep these subtle so wallpaper shows through
call s:HL("CursorLine",   "",        s:bg_none, "NONE",  "",          "")
call s:HL("ColorColumn",  "",        s:bg_none, "NONE",  "",          "")
call s:HL("CursorColumn", "",        s:bg_none, "NONE",  "",          "")

" Pmenu: slight background so menus remain readable
call s:HL("Pmenu",        s:fg_base, s:sel,     "",      s_ct_fg,     s_ct_selbg)
call s:HL("PmenuSel",     s:bg_none, s:fg_base, "bold",  "",          s_ct_fg)
call s:HL("PmenuSbar",    "",        s:line,    "",      "",          s_ct_linebg)
call s:HL("PmenuThumb",   "",        s:fg_brt,  "",      "",          s_ct_bright)

" Statusline—transparent by default so it blends; make bold for clarity
call s:HL("StatusLine",   s:fg_brt,  s:bg_none, "bold",  s_ct_fg,     "")
call s:HL("StatusLineNC", s:fg_dim,  s:bg_none, "",      s_ct_dim,    "")

" Search/Visual need backgrounds for usability
call s:HL("Search",       s:bg_none, s:fg_brt,  "reverse", "0",       s_ct_bright)
call s:HL("IncSearch",    s:bg_none, s:fg_brt,  "reverse", "0",       s_ct_bright)
call s:HL("Visual",       "",        s:sel,     "NONE",   "",         s_ct_selbg)
call s:HL("MatchParen",   s:bg_none, s:fg_brt,  "bold",   "0",        s_ct_bright)

" ===== Syntax =====
call s:HL("Comment",     s:fg_dim,   s:bg_none, "italic", s_ct_dim,   "")
call s:HL("String",      s:fg_mint,  s:bg_none, "",       s_ct_mint,  "")
call s:HL("Character",   s:fg_mint,  s:bg_none, "",       s_ct_mint,  "")
call s:HL("Number",      s:fg_yg,    s:bg_none, "",       s_ct_yg,    "")
call s:HL("Boolean",     s:fg_yg,    s:bg_none, "bold",   s_ct_yg,    "")
call s:HL("Constant",    s:fg_yg,    s:bg_none, "",       s_ct_yg,    "")
call s:HL("Identifier",  s:fg_base,  s:bg_none, "",       s_ct_fg,    "")
call s:HL("Function",    s:fg_brt,   s:bg_none, "bold",   s_ct_fg,    "")
call s:HL("Statement",   s:fg_teal,  s:bg_none, "bold",   s_ct_teal,  "")
call s:HL("Conditional", s:fg_teal,  s:bg_none, "bold",   s_ct_teal,  "")
call s:HL("Repeat",      s:fg_teal,  s:bg_none, "bold",   s_ct_teal,  "")
call s:HL("Operator",    s:fg_brt,   s:bg_none, "",       s_ct_fg,    "")
call s:HL("Keyword",     s:fg_teal,  s:bg_none, "bold",   s_ct_teal,  "")
call s:HL("PreProc",     s:fg_base,  s:bg_none, "",       s_ct_fg,    "")
call s:HL("Type",        s:fg_olive, s:bg_none, "",       s_ct_olive, "")
call s:HL("Special",     s:fg_brt,   s:bg_none, "",       s_ct_bright,"")
call s:HL("Underlined",  s:fg_brt,   s:bg_none, "underline", s_ct_fg, "")

" ===== Diagnostics / Diffs =====
call s:HL("Error",       s:fg_olive, s:bg_none, "bold", s_ct_olive, "")

" Use links to avoid harsh reds; keep within green family
hi! link DiagnosticError Error
hi! link DiagnosticWarn  Statement
hi! link DiagnosticInfo  Identifier
hi! link DiagnosticHint  Comment

call s:HL("DiffAdd",     s:fg_brt,   s:bg_none, "reverse", s_ct_bright, "")
call s:HL("DiffChange",  s:fg_teal,  s:bg_none, "reverse", s_ct_teal,   "")
call s:HL("DiffDelete",  s:fg_dim,   s:bg_none, "reverse", s_ct_dim,    "")
call s:HL("DiffText",    s:fg_base,  s:bg_none, "reverse,bold", s_ct_fg, "")

