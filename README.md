# autols.fish
Automatically run ls whenever you enter a different directory. Add ignore rules to ignore certain directories. Works with fish built-in `cd`, `cdh` and shell agnostic programs such as [zoxide](https://github.com/ajeetdsouza/zoxide).

<!-- Can be toggled on and off by using the provided helper function `autols-toggle [on|off]` -->

<!-- TODO: update video -->
<!-- [![asciicast](https://asciinema.org/a/359379.svg)](https://asciinema.org/a/359379) -->

## Installation

### Using [Fisher](https://github.com/jorgebucaran/fisher)
```fish
fisher install kpbaks/autols.fish
```

## Usage

`autols.fish` is enabled by default. You can disable it by using the provided function `autols`.

```fish
autols off # disable autols
autols on  # enable autols
autols status # check if autols is enabled
autols toggle # toggle autols
```

### Ignore rules

You can add ignore rules to ignore certain directories. This is useful if you have a directory with a lot of files, and you don't want to run `ls` every time you enter it. Ignore rules are edited using the `autols` function.

```fish
autols ignore add <directory> # add a directory to the ignore list
autols ignore "*/build/" # Ignore all directories named build
autols ignore rm <directory> # remove a directory from the ignore list
autols ignore list # list all ignored directories
autols ignore clear # clear all ignored directories
```


See `autols --help` for more information.

## Inspiration
- https://github.com/desyncr/auto-ls


## How it works

`fish` has an event system that allows you to run functions when certain events occur. In this case, we want to run `ls` whenever we enter a new directory. To do this, we listen to the `fish_postexec` event, and check if the current directory is different from the previous one. If it is, we run `ls` and update the previous directory.
