# GDB cheat sheet, all basics command that took 20% of total but account for 80% of the usage

## Basic commands
- `run (r) arg1 arg2 <and pipe, output redirect, etc..>` so basically `run` is just replacement of the executable file name 
- `start` run and break at main, quicker than `break main` then `run`
- `break (b) <line number/function name>` set breakpoint
- `list (l) <line num>` print 5 line before and after the current point of program or the specified line
- `print (p) <any c++ expr or variable>` print the current value of vars or evaluation of expr
- `quit (q)` quit the debugger
- `up/down (u/d)` move up/down the **call stack**
- `display/undisplay <var/display#>` keep printing the value of a variable everytime stepping through the code, `undisplay` remove tracking var base on display#
- `backtrace (bt)` print the **entire call stack**
- `step (s)` //step **into** the calling function (or the first evaluating one) 
- `continue (c)` continue until next breakpoint/program exit 
- `finish` run until the **current stack frame pop**
- `watch (w) <var>` set a watcher to break when the watching var change its value
- `info/delete (i/d) <options>` get info on literally whatever you need, delete any type of break/watch/trace/catchpoints
- `whatis (what) <var>` tell the type of var

## Advance commands
- `target record-full` start record every changes of variables in the program so that reverse is possible
- `reverse-next/step/continue (rn/s/c)` reverse next/step/continue commands, breakpoints does apply to this commands
- `set var <expr var=...>` change the value of the variable 