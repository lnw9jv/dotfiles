if ((!$+commands[goose])); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_goose" ]]; then
    typeset -g -A _comps
    autoload -Uz _goose
    _comps[goose]=_goose
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_goose" || "$commands[goose]" -nt "$ZSH_CACHE_DIR/completions/_goose" ]]; then
    goose completion zsh >|"$ZSH_CACHE_DIR/completions/_goose" &|
fi
