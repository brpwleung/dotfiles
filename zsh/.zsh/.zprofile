[[ -f "${HOME}/.profile" ]] && source "${HOME}/.profile"

typeset -U PATH path
[[ -d "${HOME}/.local/bin" ]] && path=("${HOME}/.local/bin" ${path})
[[ -d "${HOME}/.personal/bin" ]] && path=("${HOME}/.personal/bin" ${path})

[[ -f "${ZDOTDIR}/.zprofile.local" ]] && source "${ZDOTDIR}/.zprofile.local"
