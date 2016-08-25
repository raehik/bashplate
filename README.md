bashplate
=========

Rationale
---------

OK, here's the thing. I don't want to repeat myself in Bash, but I keep using
the same damn functions all the time! There are lots of frameworks on GitHub
which aim to fix this problem, but they have a habit of being absolute monsters
in terms of size -- if I need a script to be over 100 lines I usually move to
Python. So I need some way to stop myself writing/auto-generating the same
generic logging, usage & options code.


Features
--------

Enter **bashplate** -- a single file you can source to make life easier when
writing shell scripts. It really does hardly anything:

  * Some logging, error functions
  * Usage handling (send to stderr on failure)
  * Long options with POSIX correctness (!!!) thanks to `getopts_long`

Seriously it's just barely over 50 lines (as of 2016-08-25). Commented fully
etc.


Usage
-----

  * Point `$_BASHPLATE_DIR` to wherever you choose to install bashplate (I use
    `~/.local/share/bashplate`).
  * Source `$_BASHPLATE_DIR/bashplate.sh`.
  * Define `$_usage` as a full usage string (e.g. `Usage: $_FILENAME
    [options]`).

The `$_FILENAME` variable is provided as the name of the script being called.


License
-------

`getopts_long.sh` is provided under the license stated in its file (IANAL but
it's a short MIT license). All other files in this repository are provided under
the MIT license (see `LICENSE`).
