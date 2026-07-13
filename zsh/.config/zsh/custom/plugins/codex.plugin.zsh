if ((!$+commands[codex])); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_codex" ]]; then
    typeset -g -A _comps
    autoload -Uz _codex
    _comps[codex]=_codex
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_codex" || "$commands[codex]" -nt "$ZSH_CACHE_DIR/completions/_codex" ]]; then
    codex completion zsh >|"$ZSH_CACHE_DIR/completions/_codex" &|
fi
