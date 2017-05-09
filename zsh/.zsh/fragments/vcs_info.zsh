autoload -Uz vcs_info

VCS_FORMATS_COMMON='%b < %u\u2bc0%f %c\u2bc0%f < %s'

zstyle ':vcs_info:*' actionformats "%B%F{green}\u2bc7 %a%f%%b < ${VCS_FORMATS_COMMON}"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "\u2bc7 ${VCS_FORMATS_COMMON}"
zstyle ':vcs_info:*' stagedstr '%F{red}'
zstyle ':vcs_info:*' unstagedstr '%F{red}'
