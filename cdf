
# cdf - Change Directory like Finder
# Use arrow key to change directory
# 
# Left  (ctrl-h)       : Change to parent directory
# Right (ctrl-l, space): Change to directory at cursor position
# Up    (ctrl-k)       : Move cursor to up
# Down  (ctrl-j, tab)  : Move cursor to down
# Enter (Esc)          : Abort

cdf() {
    local FLG_A path_opt

    while getopts ah OPT
    do
        case $OPT in
            "a" )
                FLG_A='TRUE'
                ;;
            "h" )
                echo 'Usage: cdf [-a] [path]'
                echo ''
                echo '-a:   Show all directories including hidden directory.'
                echo 'path: Start with given path. If omitted, current path is used.'
                return
                ;;
        esac
    done
    shift `expr $OPTIND - 1`

    if [[ "$FLG_A" == 'TRUE' ]]; then
        path_opt='*/\..*'
    else
        path_opt='*/.*'
    fi

    given_path=${1:-.}
    if [[ -d "$given_path" ]]; then
        cd $given_path
    else
        echo 'No such Directory.'
        return
    fi

    local full_path
    full_path=`pwd | sed -e 's/^\/$//g'`

    while out=$(find . -maxdepth 1 -path "$path_opt" -prune -o -type d -print 2> /dev/null | LC_ALL=C sort -f | sed -e 's/^\.\///g' -e 's/\/*$/\//g' | fzf +m --expect=left,ctrl-h,right,ctrl-l,enter,space --bind=tab:down --cycle --border --ansi --preview "ls -F {}" --preview-window=right:50% --layout=reverse --prompt="$full_path/" --no-clear)
    do
        # split fzf output into key input and directory name
        key=`echo "$out" | head -1`
        dir=`echo "$out" | tail -1 | sed -e 's/\/*$//g'`
        
        # Enter to quit
        if [[ "$key" == 'enter' ]]; then
            break
        fi
        
        # Change $full_path to the parent directory
        if [[ "$key" == 'left' ]] || [[ "$key" == 'ctrl-h' ]]; then
            full_path=`echo "$full_path" | sed -e 's/\/[^\/]*$//g'`

            if [[ "$full_path" == '' ]]; then
                full_path='/'
            fi
        # Change $full_path to the selected directory
        else
            if [[ "$dir" != '.' ]]; then
                full_path="$full_path/`echo $dir`"
            fi
        fi
        
        # Change directory
        cd "$full_path"

        # use '' if $full_path is '/'
        if [[ "$full_path" == '/' ]]; then
            full_path=''
        fi
    done
    
    # restore the screen
    tput rmcup
}
