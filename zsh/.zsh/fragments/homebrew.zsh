if ! command -v brew > /dev/null; then
    HOMEBREW_PREFIX='/opt/homebrew'
    [[ -d "${HOMEBREW_PREFIX}/bin" ]] && eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"
fi
