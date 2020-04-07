let s:save_cpo = &cpo
set cpo&vim

if g:darkula_level == 1
  let s:buf_bg = "darker_grey"
  let s:focus_bg = "dark_grey"
  let s:ui_bg = "dark_grey"
  let s:ui_fg = "dark_white"
  let s:ui_nc = "lighter_grey"
elseif g:darkula_level == 2
  let s:buf_bg = "dark_grey"
  let s:focus_bg = "grey"
  let s:ui_bg = "grey"
  let s:ui_fg = "white"
  let s:ui_nc = "lighter_grey"
else " if g:darkula_level == 0
  let s:buf_bg = "black"
  let s:focus_bg = "darker_grey"
  let s:ui_bg = "darker_grey"
  let s:ui_fg = "lighter_grey"
  let s:ui_nc = "grey"
endif

function! s:ui_color(fg)
  return [g:darkula_color_map[a:fg], g:darkula_color_map[s:ui_bg], g:darkula_term_color_map[a:fg], g:darkula_term_color_map[s:ui_bg]]
endfunction

function! s:ui_inv_color(fg)
  return [g:darkula_color_map[s:ui_bg], g:darkula_color_map[a:fg], g:darkula_term_color_map[s:ui_bg], g:darkula_term_color_map[a:fg]]
endfunction

function! s:build_palette() abort
  let col_base = s:ui_color(s:ui_fg)

  let p = {}

  let col_inactive = s:ui_color(s:ui_nc)
  let col_invis = s:ui_color(s:ui_bg)
  let p.inactive = airline#themes#generate_color_map(
        \ col_inactive,
        \ col_inactive,
        \ col_inactive,
        \ col_invis,
        \ col_invis,
        \ col_invis,
        \)

  let p.normal = airline#themes#generate_color_map(
        \ s:ui_inv_color("blue"),
        \ s:ui_color("blue"),
        \ col_base,
        \ )

  let p.insert = airline#themes#generate_color_map(
        \ s:ui_inv_color("dark_sea_green"),
        \ s:ui_color("dark_sea_green"),
        \ col_base,
        \ )

  let p.replace = airline#themes#generate_color_map(
        \ s:ui_inv_color("red_orange"),
        \ s:ui_color("red_orange"),
        \ col_base,
        \ )

  let p.visual = airline#themes#generate_color_map(
        \ s:ui_inv_color("yellow"),
        \ s:ui_color("yellow"),
        \ col_base,
        \ )

  " Accents
  let p.accents = {
        \ "red": s:ui_color("red_orange"),
        \ "green": s:ui_color("dark_sea_green"),
        \ "blue": s:ui_color("blue"),
        \ "yellow": s:ui_color("yellow"),
        \ "orange": s:ui_color("yellow_orange"),
        \ "purple": s:ui_color("purple"),
        \ "none": s:ui_color(s:ui_fg),
        \ }

  " Error
  let col_error = s:ui_inv_color("red_orange")
  let p.inactive.airline_error = col_error
  let p.insert.airline_error = col_error
  let p.normal.airline_error = col_error
  let p.replace.airline_error = col_error
  let p.visual.airline_error = col_error

  " Warning
  let col_warning = s:ui_inv_color("yellow")
  let p.inactive.airline_warning = col_warning
  let p.insert.airline_warning = col_warning
  let p.normal.airline_warning = col_warning
  let p.replace.airline_warning = col_warning
  let p.visual.airline_warning = col_warning

  return p
endfunction


let g:airline#themes#darkula#palette = s:build_palette()


let &cpo = s:save_cpo
unlet s:save_cpo
