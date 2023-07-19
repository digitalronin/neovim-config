"Debugging

function InsertDebugStatement()
  let debug = "debugger; 1"  | " default because it works for ruby & javascript

  if (&filetype == "python")
    let debug = "import pdb; pdb.set_trace()"
  endif

  if (&filetype == "elixir")
    let debug = "TestHelper.enable_debug_logging"
  endif

  exec ":normal O" . debug
  exec ":write"

endfunction

map <Leader>db :call InsertDebugStatement()<CR>

map <Leader>bp Obinding.pry<CR><ESC>:w<CR>
map <Leader>br Oborder: 2px solid red;<CR><ESC>:w<CR>
