" Darkula color scheme

set background=dark
hi clear

if exists("syntax_on")
	syntax reset
endif

let colors_name = "darkula"

" Colors
" -----------------------------------------------------------------------------

let g:darkula_color_map = {}
let g:darkula_color_map.none           = "NONE"
let g:darkula_color_map.black          = "#000000"
let g:darkula_color_map.darker_grey    = "#121212"
let g:darkula_color_map.dark_grey      = "#262626"
let g:darkula_color_map.grey           = "#444444"
let g:darkula_color_map.light_grey     = "#585858"
let g:darkula_color_map.lighter_grey   = "#666666"
let g:darkula_color_map.white          = "#c0c0c0"
let g:darkula_color_map.dark_white     = "#9e9e9e"
let g:darkula_color_map.blue           = "#5f87af"
let g:darkula_color_map.bright_purple  = "#5f00ff"
let g:darkula_color_map.cyan           = "#00d7d7"
let g:darkula_color_map.dark_orange    = "#af5f00"
let g:darkula_color_map.dark_sea_green = "#5f875f"
let g:darkula_color_map.green          = "#00af00"
let g:darkula_color_map.light_cyan     = "#5fafaf"
let g:darkula_color_map.magenta        = "#ff0087"
let g:darkula_color_map.orange         = "#d78700"
let g:darkula_color_map.purple         = "#8787af"
let g:darkula_color_map.red            = "#d70000"
let g:darkula_color_map.red_orange     = "#af5f5f"
let g:darkula_color_map.yellow         = "#808000"
let g:darkula_color_map.yellow_orange  = "#d7af00"

" Neovim terminal
" -----------------------------------------------------------------------------
"
let g:terminal_color_0  = g:darkula_color_map.black
let g:terminal_color_1  = g:darkula_color_map.red
let g:terminal_color_2  = g:darkula_color_map.dark_sea_green
let g:terminal_color_3  = g:darkula_color_map.yellow
let g:terminal_color_4  = g:darkula_color_map.bright_purple
let g:terminal_color_5  = g:darkula_color_map.purple
let g:terminal_color_6  = g:darkula_color_map.cyan
let g:terminal_color_7  = g:darkula_color_map.dark_white
let g:terminal_color_8  = g:darkula_color_map.lighter_grey
let g:terminal_color_9  = g:darkula_color_map.red_orange
let g:terminal_color_10 = g:darkula_color_map.green
let g:terminal_color_11 = g:darkula_color_map.yellow_orange
let g:terminal_color_12 = g:darkula_color_map.blue
let g:terminal_color_13 = g:darkula_color_map.magenta
let g:terminal_color_14 = g:darkula_color_map.light_cyan
let g:terminal_color_15 = g:darkula_color_map.white

" Utility
" -----------------------------------------------------------------------------
"
function! s:highlight(group, fg, bg, attr, ...)
  if a:0 > 0
    let l:sp = g:darkula_color_map[a:1]
  else
    let l:sp = "NONE"
  endif
  exec "highlight! " . a:group
    \. " ctermfg=NONE ctermbg=NONE cterm=NONE"
    \. " guifg=" . g:darkula_color_map[a:fg]
    \. " guibg=" . g:darkula_color_map[a:bg]
    \. " gui="   . a:attr
    \. " guisp=" . l:sp
endfunction

function! s:highlight_ref(group, color, ...)
  if a:0 > 0
    let l:level = a:1
  else
    let l:level = g:darkula_emphasis
  endif
  if l:level == 0
    call s:highlight(a:group, "none", "none", "UNDERCURL", a:color)
  elseif l:level == 1
    call s:highlight(a:group, "none", g:darkula_focus_bg, "UNDERCURL", a:color)
  elseif l:level == 2
    call s:highlight(a:group, a:color, g:darkula_buf_bg, "NONE")
  else
    call s:highlight(a:group, g:darkula_buf_bg, a:color, "NONE")
  endif
endfunction

" Basic Highlighting
" -----------------------------------------------------------------------------

if exists("g:darkula_black")
  if g:darkula_black
    let g:darkula_level = 0
  else
    let g:darkula_level = 1
  endif
  unlet g:darkula_black
endif

if !exists("g:darkula_level")
  let g:darkula_level = 1
endif

if !exists("g:darkula_emphasis")
  let g:darkula_emphasis = 2
endif

function! s:darkula_emphasis_cycle()
  if g:darkula_emphasis == 0
    let g:darkula_emphasis = 1
  elseif g:darkula_emphasis == 1
    let g:darkula_emphasis = 2
  elseif g:darkula_emphasis == 2
    let g:darkula_emphasis = 3
  else
    let g:darkula_emphasis = 0
  endif
  call s:refresh()
endfunction

function! s:darkula_cycle()
  if g:darkula_level == 0
    let g:darkula_level = 1
  elseif g:darkula_level == 1
    let g:darkula_level = 2
  else
    let g:darkula_level = 0
  endif
  call s:refresh()
endfunction

function! s:refresh()
  call s:setup()
  if exists("g:airline_theme") && g:airline_theme == "darkula"
    call airline#switch_theme("darkula")
  endif
endfunction

command! DarkulaCycle call <sid>darkula_cycle()
command! DarkulaEmphasisCycle call <sid>darkula_emphasis_cycle()

function! s:setup()

  if g:darkula_level == 0
    let g:darkula_buf_bg = "black"
    let g:darkula_buf_fg = "lighter_grey"
    let g:darkula_focus_bg = "darker_grey"
    let g:darkula_focus_fg = "light_grey"
    let g:darkula_ui_bg = "darker_grey"
    let g:darkula_ui_fg = "lighter_grey"
    let g:darkula_comment_fg = "grey"
  elseif g:darkula_level == 1
    let g:darkula_buf_bg = "darker_grey"
    let g:darkula_buf_fg = "dark_white"
    let g:darkula_focus_bg = "dark_grey"
    let g:darkula_focus_fg = "lighter_grey"
    let g:darkula_ui_bg = "dark_grey"
    let g:darkula_ui_fg = "dark_white"
    let g:darkula_comment_fg = "light_grey"
  else " if g:darkula_level == 2
    let g:darkula_buf_bg = "dark_grey"
    let g:darkula_buf_fg = "white"
    let g:darkula_focus_bg = "grey"
    let g:darkula_focus_fg = "dark_white"
    let g:darkula_ui_bg = "grey"
    let g:darkula_ui_fg = "white"
    let g:darkula_comment_fg = "lighter_grey"
  endif

" General
call s:highlight("Normal",      g:darkula_buf_fg,    g:darkula_buf_bg,  "NONE")
call s:highlight("NonText",     g:darkula_buf_bg,    "none",            "NONE")
call s:highlight("Conceal",     g:darkula_focus_bg,  "none",            "NONE")
call s:highlight("Ignore",      "none",              "none",            "NONE")
call s:highlight("SpecialKey",  "blue",              "none",            "NONE")

" Cursor
call s:highlight("Cursor",   g:darkula_focus_bg,  "blue",              "NONE")
call s:highlight("nCursor",  g:darkula_focus_bg,  "blue",              "NONE")
call s:highlight("lCursor",  g:darkula_focus_bg,  "bright_purple",     "NONE")
call s:highlight("iCursor",  g:darkula_focus_bg,  "dark_sea_green",    "NONE")
call s:highlight("rCursor",  g:darkula_focus_bg,  "red_orange",        "NONE")
call s:highlight("vCursor",  g:darkula_focus_bg,  "yellow",            "NONE")
call s:highlight("cCursor",  g:darkula_focus_bg,  g:darkula_focus_fg,  "NONE")

call s:highlight("CursorLine",    "none",  g:darkula_focus_bg,  "NONE")
call s:highlight("ColorColumn",   "none",  g:darkula_focus_bg,  "NONE")
call s:highlight("CursorColumn",  "none",  g:darkula_focus_bg,  "NONE")

" Windows and tabs
call s:highlight("LineNr",        g:darkula_ui_fg,     g:darkula_ui_bg,     "NONE")
call s:highlight("ModeMsg",       "light_cyan",        "none",              "NONE")
call s:highlight("MoreMsg",       "light_cyan",        "none",              "NONE")
call s:highlight("StatusLine",    g:darkula_ui_fg,     g:darkula_ui_bg,     "NONE")
call s:highlight("StatusLineNC",  g:darkula_ui_fg,     g:darkula_ui_bg,     "BOLD")
call s:highlight("TabLine",       g:darkula_ui_fg,     g:darkula_ui_bg,     "NONE")
call s:highlight("TabLineFill",   "none",              "none",              "NONE")
call s:highlight("TabLineSel",    g:darkula_focus_fg,  g:darkula_focus_bg,  "BOLD")
call s:highlight("Title",         "none",              "none",              "NONE")
call s:highlight("VertSplit",     g:darkula_ui_bg,     g:darkula_ui_bg,     "NONE")

" Selections and blocks
call s:highlight("Visual",          "none",            g:darkula_focus_bg,  "NONE")
call s:highlight("VisualNOS",       "none",            g:darkula_focus_bg,  "NONE")
call s:highlight_ref("MatchParen",  "orange")
call s:highlight_ref("Search",      "yellow_orange")

" Folding
call s:highlight("FoldColumn",  g:darkula_ui_fg,       g:darkula_ui_bg,   "NONE")
call s:highlight("Folded",      g:darkula_comment_fg,  g:darkula_buf_bg,  "NONE")

" Menus
call s:highlight("WildMenu",    g:darkula_ui_fg,  g:darkula_ui_bg,  "NONE")
call s:highlight("SignColumn",  "none",           g:darkula_ui_bg,  "NONE")

" Errors and warnings
call s:highlight("Error",       "red",      "none",  "NONE")
call s:highlight("ErrorMsg",    "red",      "none",  "NONE")
call s:highlight("WarningMsg",  "yellow",   "none",  "NONE")
call s:highlight("Todo",        "magenta",  "none",  "NONE")
call s:highlight("Question",    "blue",     "none",  "NONE")

" Spelling
call s:highlight("SpellBad",    "none",     "none",  "UNDERCURL",  g:darkula_comment_fg)
call s:highlight("SpellCap",    "none",     "none",  "UNDERCURL",  g:darkula_comment_fg)
call s:highlight("SpellRare",   "none",     "none",  "ITALIC")
call s:highlight("SpellLocal",  "none",     "none",  "ITALIC")

" Popup menu
call s:highlight("Pmenu",       g:darkula_ui_fg,  g:darkula_ui_bg,  "NONE")
call s:highlight("PmenuSel",    g:darkula_ui_bg,  g:darkula_ui_fg,  "NONE")
call s:highlight("PmenuSbar",   "none",           g:darkula_ui_bg,  "NONE")
call s:highlight("PmenuThumb",  "none",           g:darkula_ui_fg,  "NONE")

" Syntax
call s:highlight("Comment",     g:darkula_comment_fg,  "none",  "NONE")
call s:highlight("Constant",    "blue",                "none",  "NONE")
call s:highlight("Delimiter",   g:darkula_buf_fg,      "none",  "NONE")
call s:highlight("Directory",   "blue",                "none",  "NONE")
call s:highlight("Identifier",  "purple",              "none",  "NONE")
call s:highlight("Operator",    g:darkula_buf_fg,      "none",  "NONE")
call s:highlight("PreCondit",   "yellow_orange",       "none",  "NONE")
call s:highlight("PreProc",     "orange",              "none",  "NONE")
call s:highlight("Special",     "red_orange",          "none",  "NONE")
call s:highlight("Statement",   "orange",              "none",  "NONE")
call s:highlight("String",      "dark_sea_green",      "none",  "NONE")
call s:highlight("Structure",   "blue",                "none",  "NONE")
call s:highlight("Type",        "dark_orange",         "none",  "NONE")

" Neovim LSP

" each diagnostic has 3 highlights:
" 1. virtual text
" 2. signs in sign column
" 3. messages in the diagnostics float

call s:highlight_ref("LspDiagnosticsError",      "red_orange")
call s:highlight("LspDiagnosticsErrorSign",      "red_orange",   g:darkula_ui_bg,  "NONE")
call s:highlight("LspDiagnosticsErrorFloating",  "red_orange",   "none",           "NONE")

call s:highlight_ref("LspDiagnosticsWarning",      "yellow")
call s:highlight("LspDiagnosticsWarningSign",      "yellow",   g:darkula_ui_bg,  "NONE")
call s:highlight("LspDiagnosticsWarningFloating",  "yellow",   "none",           "NONE")

call s:highlight_ref("LspDiagnosticsInformation",      "green")
call s:highlight("LspDiagnosticsInformationSign",      "green",   g:darkula_ui_bg,  "NONE")
call s:highlight("LspDiagnosticsInformationFloating",  "green",   "none",           "NONE")

call s:highlight_ref("LspDiagnosticsHint",      "blue")
call s:highlight("LspDiagnosticsHintSign",      "blue",   g:darkula_ui_bg,  "NONE")
call s:highlight("LspDiagnosticsHintFloating",  "blue",   "none",           "NONE")

call s:highlight_ref("LspReferenceText",   "orange")
call s:highlight_ref("LspReferenceRead",   "blue")
call s:highlight_ref("LspReferenceWrite",  "cyan")

" Special Highlighting
" -----------------------------------------------------------------------------

" NERDTree
call s:highlight("NERDTreeExecFile",    "red",            g:darkula_ui_bg,  "NONE")
call s:highlight("NERDTreeClosable",    g:darkula_ui_fg,  g:darkula_ui_bg,  "NONE")
call s:highlight("NERDTreeOpenable",    g:darkula_ui_fg,  g:darkula_ui_bg,  "NONE")
call s:highlight("NERDTreeLinkFile",    "purple",         g:darkula_ui_bg,  "NONE")
call s:highlight("NERDTreeLinkTarget",  "cyan",           "none",           "NONE")

" OverLength
call s:highlight("OverLength", "none", g:darkula_focus_bg, "NONE")

" TrailingWhitespace
call s:highlight("TrailingWhitespace", "none", "bright_purple", "NONE")

" git commit
call s:highlight("gitcommitSummary",  g:darkula_buf_fg,  g:darkula_buf_bg,  "NONE")

" git diff
call s:highlight("diffAdded",    "green",  "none",  "NONE")
call s:highlight("diffRemoved",  "red",    "none",  "NONE")

" diff
call s:highlight("DiffAdd",     "green",             g:darkula_focus_bg,  "NONE")
call s:highlight("DiffDelete",  "red",               g:darkula_focus_bg,  "NONE")
call s:highlight("DiffChange",  "orange",            g:darkula_focus_bg,  "NONE")
call s:highlight("DiffText",    g:darkula_focus_fg,  g:darkula_focus_bg,  "NONE")

" HTML
hi link htmltagname Keyword
hi link htmlstring String
hi link htmlH1 Statement
hi link htmlH2 Statement
hi link htmlH3 Statement
hi link htmlH4 Statement
hi link htmlH5 Statement
hi link htmlH6 Statement

" Markdown
call s:highlight("mkdURL",   "cyan",  "none",  "NONE")
call s:highlight("mkdLink",  "none",  "none",  "BOLD")

" Startify
call s:highlight("StartifyBracket",  g:darkula_comment_fg,  "none",  "NONE")
call s:highlight("StartifyNumber",   "dark_sea_green",      "none",  "NONE")
call s:highlight("StartifySlash",    g:darkula_comment_fg,  "none",  "NONE")

" Go specifics
call s:highlight("goReceiverType",  "dark_orange",  "none",  "NONE")
call s:highlight("goArgumentType",  "dark_orange",  "none",  "NONE")

" vimoxide/quick-scope
if exists("g:darkula_oxide_level")
  let l:oxide_level = g:darkula_oxide_level
else
  let l:oxide_level = 3
endif
call s:highlight_ref("QuickScopePrimary",    "green",  l:oxide_level)
call s:highlight_ref("QuickScopeSecondary",  "cyan",   l:oxide_level)

endfunction

call s:setup()
