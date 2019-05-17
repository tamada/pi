__pi_graphs_create() {
    if [[ "$1" =~ ^\- ]]; then
        COMPREPLY=($(compgen -W "-u --username -g --graph-id -n --name -i --unit -t --type -c --color -z --timezone -s --self-sufficient -x --is-secret" -- "$1"))
    elif [ "$2" = "-t" ] || [ "$2" = "--type" ]; then
        COMPREPLY=($(compgen -W "int float" -- "$1"))
    elif [ "$2" = "-c" ] || [ "$2" = "--color" ]; then
        COMPREPLY=($(compgen -W "shibafu momiji sora ichou ajisai kuro" -- "$1"))
    elif [ "$2" = "-s" ] || [ "$2" = "--self-sufficient" ]; then
        COMPREPLY=($(compgen -W "increment decrement" -- "$1"))
    fi
}

__pi_graphs_get_or_list() {
    if [[ "$1" =~ ^\- ]]; then
        COMPREPLY=($(compgen -W "-u --username" -- "$1"))
    fi
}

__pi_graphs_svg() {
    if [[ "$1" =~ ^\- ]]; then
        COMPREPLY=($(compgen -W "-u --username -g --graph-id -d --date -m --mode" -- "$1"))
    elif [ "$2" = "-m" ] || [ "$2" = "--mode" ]; then
        COMPREPLY=($(compgen -W "short line" -- "$1"))
    fi
}

__pi_graphs_update() {
    if [[ "$1" =~ ^\- ]]; then
        COMPREPLY=($(compgen -W "-u --username -g --graph-id -n --name -i --unit -c --color -z --timezone -s --self-sufficient -x --is-secret -p --purge-cache-urls" -- "$1"))
    elif [ "$2" = "-c" ] || [ "$2" = "--color" ]; then
        COMPREPLY=($(compgen -W "shibafu momiji sora ichou ajisai kuro" -- "$1"))
    elif [ "$2" = "-s" ] || [ "$2" = "--self-sufficient" ]; then
        COMPREPLY=($(compgen -W "increment decrement" -- "$1"))
    fi
}

__pi_graphs_detail_delete_or_stats() {
    if [[ "$1" =~ ^\- ]]; then
        COMPREPLY=($(compgen -W "-u --username -g --graph-id" -- "$1"))
    fi
}

__pi_graphs_pixels() {
    if [[ "$1" =~ ^\- ]]; then
        COMPREPLY=($(compgen -W "-u --username -g --graph-id -f --from -t --to" -- "$1"))
    fi
}

__pi_graphs() {
    if [ "$4" = "$2" ]; then
        COMPREPLY=($(compgen -W "create get svg update detail list delete pixels stats" -- "$1"))
        return 0
    else
        local subsub="${COMP_WORDS[2]}"
        case "${subsub}" in
            create)
                __pi_graphs_create "$1" "$2" "$3" "$4" "$subsub"
                ;;
            get)
                __pi_graphs_get_or_list "$1" "$2" "$3" "$4" "$subsub"
                ;;
            svg)
                __pi_graphs_svg "$1" "$2" "$3" "$4" "$subsub"
                ;;
            update)
                __pi_graphs_update "$1" "$2" "$3" "$4" "$subsub"
                ;;
            detail)
                __pi_graphs_detail_delete_or_stats "$1" "$2" "$3" "$4" "$subsub"
                ;;
            list)
                __pi_graphs_get_or_list "$1" "$2" "$3" "$4" "$subsub"
                ;;
            delete)
                __pi_graphs_detail_delete_or_stats "$1" "$2" "$3" "$4" "$subsub"
                ;;
            pixels)
                __pi_graphs_pixels "$1" "$2" "$3" "$4" "$subsub"
                ;;
            stats)
                __pi_graphs_detail_delete_or_stats "$1" "$2" "$3" "$4" "$subsub"
                ;;
        esac
    fi
}

__pi_pixel_post() {
    if [[ "$1" =~ ^\- ]]; then
        COMPREPLY=($(compgen -W "-u --username -g --graph-id -d --date -q --quantity -o --optional-data" -- "$1"))
    fi
}

__pi_pixel_get_or_delete() {
    if [[ "$1" =~ ^\- ]]; then
        COMPREPLY=($(compgen -W "-u --username -g --graph-id -d --date" -- "$1"))
    fi
}

__pi_pixel_update() {
    if [[ "$1" =~ ^\- ]]; then
        COMPREPLY=($(compgen -W "-u --username -g --graph-id -d --date -q --quantity -o --optional-data" -- "$1"))
    fi
}

__pi_pixel_increment_or_decrement() {
    if [[ "$1" =~ ^\- ]]; then
        COMPREPLY=($(compgen -W "-u --username -g --graph-id" -- "$1"))
    fi
}

__pi_pixel() {
    if [ "$4" = "$2" ]; then
        COMPREPLY=($(compgen -W "post get update increment decrement delete" -- "$1"))
        return 0
    else
        local subsub="${COMP_WORDS[2]}"
        case "${subsub}" in
            post)
                __pi_pixel_post "$1" "$2" "$3" "$4" "$subsub"
                ;;
            get)
                __pi_pixel_get_or_delete "$1" "$2" "$3" "$4" "$subsub"
                ;;
            update)
                __pi_pixel_update "$1" "$2" "$3" "$4" "$subsub"
                ;;
            increment)
                __pi_pixel_increment_or_decrement "$1" "$2" "$3" "$4" "$subsub"
                ;;
            decrement)
                __pi_pixel_increment_or_decrement "$1" "$2" "$3" "$4" "$subsub"
                ;;
            delete)
                __pi_pixel_get_or_delete "$1" "$2" "$3" "$4" "$subsub"
                ;;
        esac
    fi
}

__pi_users_create() {
    if [[ "$1" =~ ^\- ]]; then
        COMPREPLY=($(compgen -W "-u --username -t --token -a --agree-terms-of-service -m --not-minor -c --thanks-code" -- "$1"))
    elif [ "$2" = "--agree-terms-of-service" ] || [ "$2" = "--not-minor" ] || [ "$2" = "-a" ] || [ "$2" = "-m" ]; then
        COMPREPLY=($(compgen -W "true false" -- "$1"))
    fi
}

__pi_users_delete() {
    if [[ "$1" =~ ^\- ]]; then
        COMPREPLY=($(compgen -W "-u --username" -- "$1"))
    fi
}

__pi_users_update() {
    if [[ "$1" =~ ^\- ]]; then
        COMPREPLY=($(compgen -W "-u --username -t --new-token -c --thanks-code" -- "$1"))
    fi
}

__pi_users() {
    if [ "$4" = "$2" ]; then
        COMPREPLY=($(compgen -W "create delete update" -- "$1"))
        return 0
    else
        local subsub="${COMP_WORDS[2]}"
        case "${subsub}" in
            create)
                __pi_users_create "$1" "$2" "$3" "$4" "$subsub"
                ;;
            delete)
                __pi_users_delete "$1" "$2" "$3" "$4" "$subsub"
                ;;
            update)
                __pi_users_update "$1" "$2" "$3" "$4" "$subsub"
                ;;
        esac
    fi
}

__pi_webhooks_create() {
    if [[ "$1" =~ ^\- ]]; then
        COMPREPLY=($(compgen -W "-u --username -g --graph-id -t --type"))
    elif [ "$2" == "--t" ] || [ "$2" == "--type" ]; then
        COMPREPLY=($(compgen -W "increment decrement"))
    fi
}

__pi_webhooks_get() {
    if [[ "$1" =~ ^\- ]]; then
        COMPREPLY=($(compgen -W "-u --username"))
    fi
}

__pi_webhooks_invoke_or_delete() {
    if [[ "$1" =~ ^\- ]]; then
        COMPREPLY=($(compgen -W "-u --username -w --webhookHash"))
    fi
}

__pi_webhooks() {
    if [ "$4" = "$2" ]; then
        COMPREPLY=($(compgen -W "create get invoke delete" -- "$1"))
        return 0
    else
        local subsub="${COMP_WORDS[2]}"
        case "${subsub}" in
            create)
                __pi_webhooks_create "$1" "$2" "$3" "$4" "$subsub"
                ;;
            get)
                __pi_webhooks_update "$1" "$2" "$3" "$4" "$subsub"
                ;;
            invoke)
                __pi_webhooks_invoke_or_delete "$1" "$2" "$3" "$4" "$subsub"
                ;;
            delete)
                __pi_webhooks_invoke_or_delete "$1" "$2" "$3" "$4" "$subsub"
                ;;
        esac
    fi
}

__pi_completions(){
    local opts cur prev subcom
    _get_comp_words_by_ref -n : cur prev cword
    subcom="${COMP_WORDS[1]}"
    opts="graphs pixel users version webhooks"

    case "${subcom}" in
        graphs)
            __pi_graphs "$cur" "$prev" "$cword" "$subcom"
            ;;
        pixel)
            __pi_pixel "$cur" "$prev" "$cword" "$subcom"
            ;;
        users)
            __pi_users "$cur" "$prev" "$cword" "$subcom"
            ;;
        webhooks)
            __pi_webhooks "$cur" "$prev" "$cword" "$subcom"
            ;;
    esac

    if [ "$cword" -eq "1" ]; then
        COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
    fi
}


complete -F __pi_completions pi
