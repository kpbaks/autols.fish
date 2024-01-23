# status is-interactive; or return 0

function __autols.fish::on::postexec --on-event fish_postexec
    # Used to control if autols should be enabled or not
    set --query AUTOLS_FISH_DISABLED; and return 0

    set --query __autols_last_dir; or set --global __autols_last_dir $PWD
    # Do not want to `ls` if the user did `cd .`
    test $PWD = $__autols_last_dir; and return 0
    set __autols_last_dir $PWD

    set -l cmd ls
    # for f in * .*
    for f in *
        # Use the long option to show what the symlink points to
        test -L $f; and set cmd ll; and break
    end

    $cmd
end
