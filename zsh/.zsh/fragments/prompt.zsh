setopt prompt_subst

function prompt_symbol {
    local symbol=''
    symbol="${symbol}%(!.%F{red}.%F{yellow})\u25cf%f"
    symbol="${symbol}%1(j.%F{green}.%F{yellow})\u25cf%f"
    symbol="${symbol}%(?.%F{yellow}.%F{red})\u25cf%f"
    symbol="%B${symbol}%b"
    printf '%b' "${symbol}"
}

function prompt_zle_mode {
    case ${KEYMAP} in
        vicmd)
            local zle_mode='C'
            ;;
        *)
            local zle_mode='N'
            ;;
    esac
    zle_mode="%B%F{yellow}${zle_mode}%f%b"
    printf '%b' "${zle_mode}"
}

PROMPT='$(prompt_zle_mode) %7(~.%-3~ +++ %3~.%~) $(prompt_symbol) '

function prompt_vcs_info {
    vcs_info
    printf '%b' "${vcs_info_msg_0_}"
}

RPROMPT='$(prompt_vcs_info)'

function prompt_continuation {
    printf '%b' '%1(_.%_.contd)'
}

PS2='$(prompt_continuation) $(prompt_symbol) '
