# function _autols --on-variable PWD
#     set --query _autols_toggle_status; and ls
# end

function _autols --on-event fish_postexec
    set --query _autols_previous_dir; or set -g _autols_previous_dir (dirs)

    set -g _autols_current_dir (dirs)

    # Test if the previous directory is equal to the current one, which is
    # set with the end of a fish prompt.
    # If they are not equal, then the shell must have switched to another directory
    # and ls should be executed. 
    # If they are equal then the shell must not have switched to another directory,
    # and there is no reason to execute ls.
    if test ! "$_autols_previous_dir" = "$_autols_current_dir"
        set -g _autols_previous_dir (dirs)  
        # query ~/.config/fish/fish_variables to see if the environment variable
        # '_autols_toggle_status' has been defined or not. It is the variable
        # which control whether or not autols is toggled on or off. It
        # can be set and unset respectively with autols_toggle [on | off].
        # If not set, then simply return since that is interpreted as autols.fish
        # being toggled off.
        if set --query _autols_toggle_status 
            ls
        end
    end
end
