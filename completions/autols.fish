set -l c complete -c autols

$c -f # Disable file completion

$c -s h -l help
set -l subcommands on off status toggle

set -l cond "not __fish_seen_subcommand_from $subcommands"
$c -n $cond -a on
$c -n $cond -a off
$c -n $cond -a status
$c -n $cond -a toggle
