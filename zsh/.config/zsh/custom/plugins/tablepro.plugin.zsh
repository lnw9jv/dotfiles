if ((!$+commands[tablepro])); then
    return 0
fi

local _tablepro_cache="$ZSH_CACHE_DIR/completions/_tablepro"
if [[ ! -s "$_tablepro_cache" || "$commands[tablepro]" -nt "$_tablepro_cache" ]]; then
    (
        tmp=$(mktemp "${_tablepro_cache:h}/.tablepro.XXXXXX") || exit 1
        trap 'rm -f -- "$tmp"' EXIT
        command tablepro completion zsh >|"$tmp" 2>/dev/null &&
            [[ -s "$tmp" ]] && mv -f -- "$tmp" "$_tablepro_cache"
    ) || true
fi

if [[ -s "$_tablepro_cache" ]]; then
    typeset -g -A _comps
    autoload -Uz _tablepro
    _comps[tablepro]=_tablepro
fi
