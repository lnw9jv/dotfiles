if ((!$+commands[floci])); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_floci" ]]; then
    typeset -g -A _comps
    autoload -Uz _floci
    _comps[floci]=_floci
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_floci" || "$commands[floci]" -nt "$ZSH_CACHE_DIR/completions/_floci" ]]; then
    floci completion zsh >|"$ZSH_CACHE_DIR/completions/_floci" &|
fi
