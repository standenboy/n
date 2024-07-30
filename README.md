# n
A tiny note script designed to help you out.
## Why
I was sick of forgetting cool projects and things that i needed to do.
## Install

It can be installed by running `make` as root in the download directory, since its all shell there 
is no need for a compiler. 
## How
N has the following options:

- p `prints and the note names and exits`
- r `lets you read all the nots`
- d `lets you delete any note`
- e `lets you edit an existing note from a list`
- blank `makes a new note`
### example
n - `will make a new note`

n p - `will print the names of all notes`

n d - `will let you delete a note from a list`

n r - `will let you read a note from a list`

n e - `will let you edit a note from a list`
### notes on n
It is written in pure posix shell.

It depends on the following:

- `a fuzzy finder such as fzf`
- `less or some other kind of reader like more (or just use your text editor)`
- `a text editor`
- `the $EDITOR variable must be set using export`

### config
It can be configured to using any fuzzy finder, and any text editor, and reader as long as they support the same 
syntax as fzf, vi, and less to function, some examples could be:
- dmenu
- rofi
- fzy `my pick`
- vim/nvim `my pick`
- emacs
- kak

The fuzzy finder is defined in the program, while the text editor is grabbed from your enviroment 
variables.
