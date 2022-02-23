# autols-fish
Automatically run ls whenever your enter a different directory.

works with fish built-in `cd`, `cdh` and shell agnostic programs such as [zoxide](https://github.com/ajeetdsouza/zoxide).

Can be toggled on and off by using the provided helper function `autols-toggle [on|off]`

[![asciicast](https://asciinema.org/a/359379.svg)](https://asciinema.org/a/359379)

## Installation
### Using [Fisher](https://github.com/jorgebucaran/fisher)
```fish
fisher install Kristoffer-PBS/autols-fish
```
## Configuration
By default autols uses ```ls```. To modify the command use
```fish
set -U autols_command "<commandToExecute>"
```
for example
```fish
set -U autols_command "exa -laB --git --group-directories-first"
```
## Inspiration
- https://github.com/desyncr/auto-ls

## TODO
- ~~The fish function `functions/_autols.fish` has to be executed at least once due to fish using lazyloading to load user functions.
Currently I have accounted for this by invoking the file in `conf.d/autols_initialize.fish`. I am not fully versed in fish script yet,
but after looking at the documentation, about which files are sourced and executed upon [shell startup](https://fishshell.com/docs/current/index.html#initialization-files), this was the only way i found to do it. I think this implementation is *"doing it the quick and dirty way"*, and I
do not prefer it, so if someone know of there is a better way please send a pull request!~~
- ~~The plugin works currently by being invoked each time the fish builtin variable `$PWD` is invoked, this means that - when toggled on - that
it is called when starting the interactive shell. This conflicts with the users `fish_greeting.fish`. In a previous implementation I used an
[event handler](https://fishshell.com/docs/current/cmds/function), that was invoked each time the fish builtin event `fish_postexec` is emitted, and then checked if current directory had been updated since the last emitted event. I might be able to fix this "bug", by using this implementation route instead
but I have not yet tried it.~~
- ~~Add asciinema gif, to show functionality of plugin.~~
- Add rules for which directories autols should be applicable for e.g. only invoke in directories containing `.git` 
- Add a "How it works" section to the readme
