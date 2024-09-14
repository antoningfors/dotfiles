" Vim color file
" Maintainer:	Anton Ingfors <Anton.Ingfors@gmail.com>
" Last Change:	2015 Jul 16

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "anton"

hi Normal 		guifg=#CDAA7D	guibg=#161616	gui=NONE 	" Normal text and background

" CURSOR
hi Cursor		guibg=lightblue					gui=NONE 	" Character under the cursor
hi CursorColumn guibg=red									" 'cursorcolumn' if set |
hi CursorLine	guibg=darkblue 								" 'cursorline' if set -

" WINDOWS
hi StatusLine	guifg=white		guibg=#4f606d		gui=NONE 	" Status line of current window -
hi StatusLineNC	guifg=white 	guibg=#243949	gui=NONE 	" Status lines of not-current windows -
hi VertSplit 									gui=NONE 	" Column separating vertically split windows |

" COMMAND LINE
hi ModeMsg		guifg=white						gui=NONE	" 'showmode' message (e.g., "-- INSERT --")
hi ErrorMsg		guifg=red 		guibg=#161616 	gui=bold 		" Error messages on the command line

" LINE NUMBERS
hi LineNr 		guifg=#373737								" Line numbers
hi CursorLineNr guifg=White 	guibg=darkblue	gui=NONE		" Line number on current line

" SEARCHING
hi IncSearch					guibg=yellow	gui=NONE	" 'incsearch' highlighting."
hi Search						guibg=yellow	gui=NONE	" 'hlsearch' highlighting.
hi WildMenu						guibg=yellow	gui=NONE	"  Current MATCH in 'wildmenu' completion

" UNCATAGORIZED
hi ColorColumn					guibg=red		gui=NONE 	" 'colorcolumn' if set
hi MatchParen	guifg=white		guibg=#161616	gui=Bold	" Character under the cursor if it is a on a paired bracket, and its match.
hi NonText		guifg=#9AB973					gui=NONE	" '~' and '@' at the end of the window and characters from 'showbreak'
hi Visual		guifg=#161616	guibg=darkgrey	gui=NONE	" Visual mode selection
hi WarningMsg	guifg=yellow					gui=bold	" Warning messages


" SYNTAX HIGHLIGHTING

" COMMENTS
hi Comment		guifg=gray50					gui=NONE 	" Any comment
hi Todo			guifg=DarkGreen	guibg=#161616	gui=NONE 	" TODO FIXME and XXX

" LITERALS
hi Constant		guifg=white						gui=NONE 	" Any literal
hi Character	guifg=#9AB973					gui=NONE 	" 'c'
hi SpecialChar	guifg=#9AB973					gui=NONE 	" Special character \n, \t etc.
hi String		guifg=#9AB973					gui=NONE 	" "Hello World"
hi Number		guifg=#CDAA7D					gui=NONE 	" 5 0xF3
hi Boolean		guifg=#20b2da					gui=NONE 	" true false
hi Float		guifg=#CDAA7D					gui=NONE 	" 3.141592

" IDENTIFIERS
hi Identifier	guifg=#9AB973					gui=NONE 	" any variable name
hi Function		guifg=#9AB973					gui=NONE 	" function name (also: methods for classes)

" KEYWORDS
hi Statement	guifg=DarkGoldenrod3			gui=NONE 	" Any other statement
hi Keyword		guifg=DarkGoldenrod3			gui=NONE 	" Any other keyword
hi Conditional	guifg=DarkGoldenrod3			gui=NONE	" if, then, else, endif, switch, etc.
hi Repeat		guifg=DarkGoldenrod3			gui=NONE 	" for, do, while, etc.
hi Label		guifg=DarkGoldenrod3			gui=NONE 	" case, default, etc.
hi Operator		guifg=#CDAA7D					gui=NONE 	" "sizeof", "+", "*", etc.
hi Exception	guifg=DarkGoldenrod3			gui=NONE 	" try, catch, throw
hi Type			guifg=#CDAA7D					gui=NONE 	" int, long, char, etc.
hi StorageClass	guifg=DarkGoldenrod3			gui=NONE 	" static, register, volatile, etc.
hi Structure	guifg=DarkGoldenrod3			gui=NONE 	" struct, union, enum, etc.
hi Typedef		guifg=DarkGoldenrod3			gui=NONE 	" A typedef

" PREPROCESSING
hi PreProc		guifg=#CDAA7D					gui=NONE 	" generic Preprocessor
hi Include		guifg=#CDAA7D					gui=NONE 	" preprocessor #include
hi Define		guifg=#CDAA7D					gui=NONE 	" preprocessor #define
hi Macro		guifg=#CDAA7D					gui=NONE 	" same as Define
hi PreCondit	guifg=#CDAA7D					gui=NONE 	" preprocessor #if, #else, #endif, etc.