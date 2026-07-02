if (( ! $+commands[zed] )); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_zed" ]]; then
    typeset -g -A _comps
    autoload -Uz _zed
    _comps[zed]=_zed
fi

zed --completions zsh >| "$ZSH_CACHE_DIR/completions/_zed" &|
