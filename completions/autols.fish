set -l c complete -c autols

$c -f # Disable file completion

$c -s h -l help
set -l subcommands on off status toggle add list ls remove rm

set -l cond "not __fish_seen_subcommand_from $subcommands"
$c -n $cond -a on
$c -n $cond -a off
$c -n $cond -a status
$c -n $cond -a toggle
$c -n $cond -a add
$c -n $cond -a list
$c -n $cond -a ls
$c -n $cond -a remove
$c -n $cond -a rm
