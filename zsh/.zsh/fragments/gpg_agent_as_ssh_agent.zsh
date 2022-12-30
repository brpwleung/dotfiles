# Start gpg-agent manually using the prescribed procedure for GnuPG 2.1, to
# make sure an instance is available for SSH as a key agent
if ! pgrep -x -u "${USER}" gpg-agent > /dev/null 2>&1; then
    gpg-connect-agent /bye > /dev/null 2>&1
fi

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    SSH_AUTH_SOCK=
    typeset -a candidate_socks
    candidate_socks+="${HOME}/.gnupg/S.gpg-agent.ssh"
    candidate_socks+="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"
    for s in ${candidate_socks[@]}; do
        [[ -e "${s}" ]] && SSH_AUTH_SOCK="${s}"
    done
    unset candidate_socks s
    export SSH_AUTH_SOCK
fi

# Configure GnuPG with the proper terminal context
export GPG_TTY="$(tty)"

# Deliberately refresh gpg-agent terminal context because, according to the
# GnuPG 2.1 documentation, SSH will not instruct gpg-agent to do the same
gpg-connect-agent updatestartuptty /bye > /dev/null
