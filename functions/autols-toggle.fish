function autols-toggle --description "toggle autols"
    # test if the proper number of arguments is parsed to the function.
    # Only one argument should be given. (on, off, -h, --help)
    

    set argv_count (count $argv)
    if test $argv_count -eq 0
        if set -q _autols_toggle_status
            echo -e "\tautols is turned on!"
        else
            echo -e "\tautols is turned off!"
        end
        return 0

    else if test ! $argv_count -eq 1
        echo -e "error:\tto many arguments parsed to function."
        echo "see --help for information of how to use function."
        return -1
    else 
        switch $argv[1]
            case "on"
                set --query _autols_toggle_status; or set -Ux _autols_toggle_status 
                echo -e "\tautols has been turned on!"
            case "off"
                set --query _autols_toggle_status; and set --erase _autols_toggle_status
                echo -e "\tautols has been turned off!"
            case "-h" "--help"
                _autols::help
        end 
    end
end

function _autols::help --description "print help message for autols-toggle"
    echo "usage:"
    echo -e "\tautols-toggle on \tturn autols on"
    echo -e "\tautols-toggle off\tturn autols off"
    echo -e "autols-toggle -h | --help\t Show this help message"

    # set -l author "Kristoffer Sørensen" 
    # set -l repo "https://github.com/Kristoffer-PBS/autols-fish"
    # echo -e "autols-fish - a small plugin that automatically invokes ls whenever you enter a new directory.\n"
    # echo -e "author:\t$author\n"
    # echo -e "repo:\t$repo\n\n"
end

