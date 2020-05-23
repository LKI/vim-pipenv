if exists("g:pipenv_loaded")
  finish
endif
let g:pipenv_loaded = 1

let g:pipenv_activated = 0
let g:pipenv_notify = 0
let s:save_cpo = &cpo
set cpo&vim

if !has('python3') && !has('python')
  finish
endif

" default: activate pipenv
if !exists("g:pipenv_auto_activate")
  let g:pipenv_auto_activate = 1
endif
" default: don't switch pipenv if already activated
if !exists("g:pipenv_auto_switch")
  let g:pipenv_auto_switch = 0
endif
" default: don't echo message when activate pipenv
if !exists("g:pipenv_notify_when_activate")
  let g:pipenv_notify_when_activate = 0
endif
" default: sync pyls(vim-lsp) when activate
if !exists("g:pipenv_lsp_server_name")
  let g:pipenv_lsp_server_name = "pyls"
endif

command! -bar -nargs=? -complete=custom,s:CompletePipenv Pipenv :call pipenv#command(<q-args>)
command! -bar -nargs=? -complete=custom,s:CompletePipenv Pvv :call pipenv#command(<q-args>)

function! s:CompletePipenv(ArgLead, CmdLine, CursorPos)
  return "install\nuninstall\ngraph\nupdate\nsync\nlock\nclean\nrun\nenable\ndisable\n"
endfunction

if g:pipenv_auto_activate == 1
  call pipenv#enable_auto()
endif

let &cpo = s:save_cpo
