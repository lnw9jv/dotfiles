if (($+commands[zoxide])); then
    eval "$(zoxide init --cmd cd zsh)"
fi

if (($+commands[uv])); then
    export PATH="$(uv tool dir --bin):$PATH"
fi

if (($+commands[brew])); then
    HOMEBREW_COMMAND_NOT_FOUND_HANDLER="${HOMEBREW_REPOSITORY:-$(brew --repository)}/Library/Homebrew/command-not-found/handler.sh"
    [[ -f $HOMEBREW_COMMAND_NOT_FOUND_HANDLER ]] && source "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER"
fi

if [ -f "$HOME/.local/bin/env" ]; then
    . "$HOME/.local/bin/env"
fi

if (($+commands[dyff])); then
    export KUBECTL_EXTERNAL_DIFF="dyff between --omit-header --set-exit-code"
fi

case "$(uname)" in
Darwin)
    path=(
        $HOME/.cargo/bin
        $HOMEBREW_PREFIX/opt/rustup/bin
        $HOMEBREW_PREFIX/opt/findutils/libexec/gnubin
        $HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin
        $HOMEBREW_PREFIX/opt/inetutils/libexec/gnubin
        $HOMEBREW_PREFIX/opt/grep/libexec/gnubin
        $HOMEBREW_PREFIX/opt/gnu-units/libexec/gnubin
        $HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnubin
        $HOMEBREW_PREFIX/opt/gnu-time/libexec/gnubin
        $HOMEBREW_PREFIX/opt/gnu-which/libexec/gnubin
        $HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin
        $HOMEBREW_PREFIX/opt/gawk/libexec/gnubin
        $HOMEBREW_PREFIX/opt/python/libexec/bin
        $HOMEBREW_PREFIX/opt/ruby/bin
        $HOMEBREW_PREFIX/opt/curl/bin
        $path
    )

    export LDFLAGS="-L$HOMEBREW_PREFIX/opt/curl/lib"
    export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/curl/include"
    export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/curl/lib/pkgconfig"

    export GROOVY_HOME="$HOMEBREW_PREFIX/opt/groovy/libexec"
    ;;
esac
