if ((!$+commands[popeye])); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_popeye" ]]; then
    typeset -g -A _comps
    autoload -Uz _popeye
    _comps[popeye]=_popeye
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_popeye" || "$commands[popeye]" -nt "$ZSH_CACHE_DIR/completions/_popeye" ]]; then
    popeye completion zsh >|"$ZSH_CACHE_DIR/completions/_popeye" &|
fi
