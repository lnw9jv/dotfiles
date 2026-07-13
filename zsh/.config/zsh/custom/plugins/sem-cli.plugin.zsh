if ((!$+commands[sem])); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_sem" ]]; then
    typeset -g -A _comps
    autoload -Uz _sem
    _comps[sem]=_sem
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_sem" || "$commands[sem]" -nt "$ZSH_CACHE_DIR/completions/_sem" ]]; then
    sem completions zsh >|"$ZSH_CACHE_DIR/completions/_sem" &|
fi
