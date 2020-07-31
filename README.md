# Darkula Vim Colorscheme

Vim colors inspired by [Intellij IDEA's Darcula][darcula] theme, but darker! It uses the
same palette, but makes slightly different choices about which colors to use
where.

Actually, it includes 3 levels of brightness, controlled by `g:darkula_level`:
- level 0 uses a hard black background
- level 1 uses a darker grey background, this is the default
- level 2 uses a dark grey background

These level may be easily cycled using the `:DarkulaCycle` command.

## Samples

### Level 0: Darkula Black

> ![Preview of Darkula Black Mode](images/darkula_black.png)
Screenshot of dark mode (level 0) on a simple Go source.

### Level 1: Darkula -- the default

> ![Preview of Darkula](images/darkula.png)
Screenshot of darker mode (level 1) on a simple Go source.

### Level 2: Darkula Grey

> ![Preview of Darkula Black Mode](images/darkula_grey.png)
Screenshot of dark mode (level 2) on a simple Go source.

## Features

### Airline theme

![Airline Samples](images/airlines.png)

### Subtle Undercurl for spelling

![Bad Spelling Sample](images/spelbad.png)

### Modal cursor highlights, matched to airline

![guicursor sample](images/cursors.png)
Requires a [`'guicursor'`][opt_guicursor] setting like:
```vim
set guicursor
  \=a:block
  \,n:nCursor
  \,c:cCursor
  \,v:vCursor
  \,i-ci-ve:ver25-iCursor
  \,r-cr:hor25-rCursor
  \,o:hor50-nCursor
```

## Lineage

- [Intellij's Darcula][darcula] theme
- originally Forked from [isobit/vim-darcula-colors][vim-darcula]
- with some philosophical inspiration from [iceberg][iceberg]

[opt_guicursor]: https://neovim.io/doc/user/options.html#'guicursor'
[vim-darcula]: //github.com/isobit/vim-darcula-colors
[iceberg]: //github.com/cocopon/iceberg.vim
[darcula]: //plugins.jetbrains.com/plugin/12692-darcula-darker-theme
