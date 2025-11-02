" lowerdecks.vim — Star Trek: Lower Decks inspired Vim colorscheme

if exists("g:colors_name")
  finish
endif
set background=dark
let g:colors_name = "lowerdecks"

" ===== Palette (GUI hex) — Star Trek: Lower Decks =====
let s:bg_none     = ""           " transparent
let s:fg_main     = "#C9D1D9"    " primary text (neutral LCARS gray)
let s:fg_dim      = "#6D7791"    " comments / subtle
let s:fg_accent   = "#FFD100"    " delta yellow (accents, cursor line nr, status)
let s:fg_string   = "#9FEAF9"    " strings (soft cyan)
let s:fg_number   = "#F5C542"    " numbers / constants (ops gold)
let s:fg_keyword  = "#2EC6B6"    " keywords / statements (medical teal)
let s:fg_type     = "#9CCAFF"    " types (science blue, soft)
let s:line        = "#101423"    " subtle panel line
let s:sel         = "#152038"    " visual/popup bg (dim navy)
let s:cur         = "#FFD100"    " cursor / highlight accent

" ===== Approx cterm fallbacks (256-color) =====
"  0:black  221:delta yellow  179:gold  75/153:blues  43:teal  244:dim gray  252:main fg  235/236:dark panels
let s_ct_main     = "252"
let s_ct_dim      = "244"
let s_ct_accent   = "221"
let s_ct_string   = "159"
let s_ct_number   = "179"
let s_ct_keyword  = "43"
let s_ct_type     = "153"
let s_ct_linebg   = "235"
let s_ct_selbg    = "236"

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
call s:HL("Normal",       s:fg_main, s:bg_none, "",      s_ct_main,   "")
call s:HL("NonText",      s:fg_dim,  s:bg_none, "",      s_ct_dim,    "")
call s:HL("SpecialKey",   s:fg_dim,  s:bg_none, "",      s_ct_dim,    "")
call s:HL("LineNr",       s:fg_dim,  s:bg_none, "",      s_ct_dim,    "")
call s:HL("CursorLineNr", s:fg_accent, s:bg_none, "bold", s_ct_accent, "")
call s:HL("SignColumn",   s:fg_dim,  s:bg_none, "",      s_ct_dim,    "")
call s:HL("VertSplit",    s:fg_dim,  s:bg_none, "",      s_ct_dim,    "")
call s:HL("EndOfBuffer",  s:fg_dim,  s:bg_none, "",      s_ct_dim,    "")

" keep these subtle so wallpaper shows through
call s:HL("CursorLine",   "",        s:bg_none, "NONE",  "",          "")
call s:HL("ColorColumn",  "",        s:bg_none, "NONE",  "",          "")
call s:HL("CursorColumn", "",        s:bg_none, "NONE",  "",          "")

" Pmenu: slight background so menus remain readable
call s:HL("Pmenu",        s:fg_main, s:sel,     "",      s_ct_main,   s_ct_selbg)
call s:HL("PmenuSel",     s:bg_none, s:fg_accent, "bold", "",         s_ct_accent)
call s:HL("PmenuSbar",    "",        s:line,    "",      "",          s_ct_linebg)
call s:HL("PmenuThumb",   "",        s:fg_accent, "",    "",          s_ct_accent)

" Statusline—transparent by default so it blends; use accent for clarity
call s:HL("StatusLine",   s:fg_accent, s:bg_none, "bold", s_ct_accent, "")
call s:HL("StatusLineNC", s:fg_dim,    s:bg_none, "",     s_ct_dim,    "")

" Search/Visual need backgrounds for usability
call s:HL("Search",       s:bg_none, s:fg_accent, "reverse", "0",      s_ct_accent)
call s:HL("IncSearch",    s:bg_none, s:fg_accent, "reverse", "0",      s_ct_accent)
call s:HL("Visual",       "",        s:sel,       "NONE",   "",        s_ct_selbg)
call s:HL("MatchParen",   s:bg_none, s:fg_accent, "bold",   "0",       s_ct_accent)

" ===== Syntax =====
call s:HL("Comment",     s:fg_dim,    s:bg_none, "italic", s_ct_dim,     "")
call s:HL("String",      s:fg_string, s:bg_none, "",       s_ct_string,  "")
call s:HL("Character",   s:fg_string, s:bg_none, "",       s_ct_string,  "")
call s:HL("Number",      s:fg_number, s:bg_none, "",       s_ct_number,  "")
call s:HL("Boolean",     s:fg_number, s:bg_none, "bold",   s_ct_number,  "")
call s:HL("Constant",    s:fg_number, s:bg_none, "",       s_ct_number,  "")
call s:HL("Identifier",  s:fg_main,   s:bg_none, "",       s_ct_main,    "")
call s:HL("Function",    s:fg_accent, s:bg_none, "bold",   s_ct_accent,  "")
call s:HL("Statement",   s:fg_keyword,s:bg_none, "bold",   s_ct_keyword, "")
call s:HL("Conditional", s:fg_keyword,s:bg_none, "bold",   s_ct_keyword, "")
call s:HL("Repeat",      s:fg_keyword,s:bg_none, "bold",   s_ct_keyword, "")
call s:HL("Operator",    s:fg_accent, s:bg_none, "",       s_ct_accent,  "")
call s:HL("Keyword",     s:fg_keyword,s:bg_none, "bold",   s_ct_keyword, "")
call s:HL("PreProc",     s:fg_main,   s:bg_none, "",       s_ct_main,    "")
call s:HL("Type",        s:fg_type,   s:bg_none, "",       s_ct_type,    "")
call s:HL("Special",     s:fg_accent, s:bg_none, "",       s_ct_accent,  "")
call s:HL("Underlined",  s:fg_accent, s:bg_none, "underline", s_ct_accent, "")

" ===== Diagnostics / Diffs =====
" Keep errors readable but on-theme; link others to calmer groups
call s:HL("Error",       s:fg_number, s:bg_none, "bold", s_ct_number, "")
hi! link DiagnosticError Error
hi! link DiagnosticWarn  Statement
hi! link DiagnosticInfo  Identifier
hi! link DiagnosticHint  Comment

call s:HL("DiffAdd",     s:fg_accent,  s:bg_none, "reverse", s_ct_accent,  "")
call s:HL("DiffChange",  s:fg_keyword, s:bg_none, "reverse", s_ct_keyword, "")
call s:HL("DiffDelete",  s:fg_dim,     s:bg_none, "reverse", s_ct_dim,     "")
call s:HL("DiffText",    s:fg_main,    s:bg_none, "reverse,bold", s_ct_main, "")
