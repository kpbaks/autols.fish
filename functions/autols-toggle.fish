function autols-toggle --description "toggle autols"
    # test if the proper number of arguments is parsed to the function.
    # Only one argument should be given. (on, off, -h, --help)
    set argv_count (count $argv)
    if test ! $argv_count -eq 1
        echo -e "error:\tto many arguments parsed to function."
        echo "see --help for information of how to use function."
    else 
        switch $argv[1]
            case "on"
                set --query _autols_toggle_status; or set -Ux _autols_toggle_status 
                echo -e "\tautols has been turned on!"
            case "off"
                set --query _autols_toggle_status; and set --erase _autols_toggle_status
                echo -e "\tautols has been turned off!"
            case "-h" "--help"
                echo "help message"
        end 
    end
end
