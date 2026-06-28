if (( ! $+commands[opencode] )); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_opencode" ]]; then
    typeset -g -A _comps
    autoload -Uz _opencode
    _comps[opencode]=_opencode
fi

opencode completion zsh >| "$ZSH_CACHE_DIR/completions/_opencode" &|
