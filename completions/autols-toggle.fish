# Disable file tab-completion
complete -c autols-toggle -f

set --local autols_commands "on off"

complete -c autols-toggle -n "not __fish_seen_subcommand_from $autols_commands" -a "on" -d "Toggle autols functionality on"
complete -c autols-toggle -n "not __fish_seen_subcommand_from $autols_commands" -a "off" -d "Toggle autols functionality off"

complete -c autols-toggle -s h -l help -d "Show help information"
