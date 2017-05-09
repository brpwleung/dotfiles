typeset -U PATH path
if command -v pyenv > /dev/null; then
    eval "$(pyenv init -)"
    if command -v pyenv-virtualenv-init > /dev/null; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi
