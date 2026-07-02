if (( ! $+commands[floci] )); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_floci" ]]; then
    typeset -g -A _comps
    autoload -Uz _floci
    _comps[floci]=_floci
fi

floci completion zsh >| "$ZSH_CACHE_DIR/completions/_floci" &|
