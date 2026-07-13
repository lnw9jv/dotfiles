if ((!$+commands[tenv])); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_tenv" ]]; then
    typeset -g -A _comps
    autoload -Uz _tenv
    _comps[tenv]=_tenv
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_tenv" || "$commands[tenv]" -nt "$ZSH_CACHE_DIR/completions/_tenv" ]]; then
    tenv completion zsh >|"$ZSH_CACHE_DIR/completions/_tenv" &|
fi
