if ((!$+commands[opencode])); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_opencode" ]]; then
    typeset -g -A _comps
    autoload -Uz _opencode
    _comps[opencode]=_opencode
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_opencode" || "$commands[opencode]" -nt "$ZSH_CACHE_DIR/completions/_opencode" ]]; then
    opencode completion zsh >|"$ZSH_CACHE_DIR/completions/_opencode" &|
fi
