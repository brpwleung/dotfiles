[[ -f "${HOME}/.profile" ]] && source "${HOME}/.profile"

typeset -U PATH path
typeset -a fragments
fragments=(
    "/usr/local/sbin"
    "${HOME}/.local/bin"
    "${HOME}/.personal/bin"
)
for f in ${fragments[@]}; do
    [[ -d "${f}" ]] && path=(${f} ${path})
done
unset f

[[ -f "${ZDOTDIR}/.zprofile.local" ]] && source "${ZDOTDIR}/.zprofile.local"
