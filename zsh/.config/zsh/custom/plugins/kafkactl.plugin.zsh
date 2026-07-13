if ((!$+commands[kafkactl])); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_kafkactl" ]]; then
    typeset -g -A _comps
    autoload -Uz _kafkactl
    _comps[kafkactl]=_kafkactl
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_kafkactl" || "$commands[kafkactl]" -nt "$ZSH_CACHE_DIR/completions/_kafkactl" ]]; then
    kafkactl completion zsh >|"$ZSH_CACHE_DIR/completions/_kafkactl" &|
fi
