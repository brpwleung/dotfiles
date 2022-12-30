if command -v pyenv > /dev/null; then
    typeset -U PATH path
    export PYENV_ROOT="${HOME}/.pyenv"
    path=("${PYENV_ROOT}/bin" ${path})
    eval "$(pyenv init -)"
    if command -v pyenv-virtualenv-init > /dev/null; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi
