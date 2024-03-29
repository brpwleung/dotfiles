if [[ -n "${XDG_CONFIG_HOME-}" ]]; then
    export NVM_DIR="${XDG_CONFIG_HOME}/nvm"
else
    export NVM_DIR="${HOME}/.nvm"
fi
[[ -f "${NVM_DIR}/nvm.sh" ]] && source "${NVM_DIR}/nvm.sh" --no-use
