function _autols --on-variable PWD
    set --query _autols_toggle_status; and ls
end



# function _autols --on-event fish_postexec
#     set --query _autols_previous_dir; or set -g _autols_previous_dir (dirs)
#     set --query _autols_current_dir; or set -g _autols_current_dir (dirs)

#     set -g _autols_current_dir (dirs)

#     if test ! "$_autols_previous_dir" = "$_autols_current_dir"
#         ls
#         set -g _autols_previous_dir (dirs)
#     end
# end


