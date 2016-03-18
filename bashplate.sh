#
# bashplate: a clean, reusable Bash framework for simple scripts.
#

# make sure they gave us a directory for bashplate files
if [[ ! -d "$_BASHPLATE_DIR" ]]; then
    >&2 echo "\
bashplate error: \$_BASHPLATE_DIR is \ invalid or undefined: '$_BASHPLATE_DIR'"
    exit 1
fi

_FILENAME="${0##*/}"

## Logging {{{
_LOGGER="echo"
_LOG_PRE="$_FILENAME"

# If verbose, log a message.
_log() {
    # if not verbose (i.e. $VERBOSE is empty), do nothing
    [[ -z $_VERBOSE ]] && return
    $_LOGGER "$_LOG_PRE: $1"
}

# Log an error, regardless of verbosity. If given a 2nd argument, exit with it
# as the exit code.
_err() {
    $_LOGGER "$_LOG_PRE: error: $1" >&2
    [[ $2 ]] && exit $2
}
## }}}

## Usage {{{
# Print usage then exit depending on given exit code.
_print_usage() {
    local pipe=1              # pipe to stdout, or...
    [[ $1 == 0 ]] && pipe=2   # ...pipe to stderr if argument is non-zero
    if [[ ! "$_usage" ]]; then
        _err "no \$_usage string defined" 1
    fi
    >&$pipe echo "$_usage"
   exit $1
}
## }}}

# command-line options
source "$_BASHPLATE_DIR/getopts_long.sh"
