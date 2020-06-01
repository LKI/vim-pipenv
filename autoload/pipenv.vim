" vim-pipenv core commands

function! pipenv#command(...)
  " Run pipenv sub-command, with two custom sub-command
  "  - pipenv enable: enable current venv
  "  - pipenv disable: disable current venv
  let action = a:0 > 0 ? a:1 : ''
  if len(action) != 0
    if action == 'disable'
      let g:pipenv_activated = 0
      call virtualenv#deactivate()
      return
    endif
    if action == 'enable'
      call pipenv#activate(1)
      return
    endif
    echo "Executing pipenv " . action . " ..."
    let output=systemlist("pipenv " . action)
    for line in output
      echom line
    endfor
  else
    " If no command, activate pipenv of currently selected buffer
    call pipenv#activate(1)
  endif
endfunction

function! pipenv#enable_auto()
  autocmd filetype python call pipenv#activate()
  autocmd BufWinEnter *.py call pipenv#notify()
endfunction

function! pipenv#notify(...)
  if !exists("g:virtualenv_loaded")
    return
  endif
  if g:pipenv_notify == 1 && g:pipenv_notify_when_activate == 1
    let clean_text = substitute(g:pipenv_name, '[[:cntrl:]]', '', 'g')
    echo "vim-pipenv | Activated venv: " . clean_text
  endif
  let g:pipenv_notify = 0
endfunction

function! pipenv#venv_name(...)
  let l:shellslash = &shellslash
  set shellslash
  let l:cmd = 'sh -c "export PIPENV_IGNORE_VIRTUALENVS=1 PIPENV_VERBOSITY=-1; cd ' . expand('%:p:h') . ' && pipenv --venv"'
  let l:venv_name = system(l:cmd)
  let &shellslash = l:shellslash
  return l:venv_name
endfunction

function! pipenv#activate_venv(venv_name)
  let g:venv_name = fnamemodify(a:venv_name, ':p:t:gs?[[:cntrl:]]??')
  call virtualenv#activate(g:venv_name)
  let g:pipenv_activated = 1
  let g:pipenv_notify = 1
  let g:pipenv_name = g:venv_name
  if g:lsp_loaded == 1 && g:pipenv_lsp_server_name != ''
    call lsp#stop_server(g:pipenv_lsp_server_name)
    call lsp#activate()
  endif
endfunction

function! pipenv#activate(...)
  let force = a:0 > 0 ? 1 : 0
  if !exists("g:virtualenv_loaded")
    echoerr "vim-virtualenv not found, pipenv venv activation disabled"
    return
  endif
  if g:pipenv_activated == 0
    " No pipenv yet: try to load one from the current file
    let l:venv_name = pipenv#venv_name()
    if v:shell_error == 0
      call pipenv#activate_venv(l:venv_name)
    endif
  elseif g:pipenv_auto_switch == 1 || force
    " Already a pipenv active, check if still the same
    let l:venv_name = pipenv#venv_name()
    if v:shell_error == 0 && l:venv_name != g:venv_name
      call pipenv#activate_venv(l:venv_name)
    endif
  endif
endfunction
