autoload -Uz vcs_info

VCS_FORMATS_COMMON='%b \u00ab %u\u25a0%f %c\u25a0%f \u00ab %s'

zstyle ':vcs_info:*' actionformats "%B%F{green}\u25cf %a%f%%b \u00ab ${VCS_FORMATS_COMMON}"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "\u25cf ${VCS_FORMATS_COMMON}"
zstyle ':vcs_info:*' stagedstr '%F{red}'
zstyle ':vcs_info:*' unstagedstr '%F{red}'
