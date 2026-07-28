# dotfiles

Personal macOS configuration managed as a collection of independent [GNU Stow](https://www.gnu.org/software/stow/) packages.

Each package directory mirrors paths below `$HOME`, so configurations can be installed individually instead of treating the repository as an all-or-nothing setup.

## Highlights

- **Shells:** Zsh with [zinit](https://github.com/zdharma-continuum/zinit), plus Bash, Fish, and Nushell configurations.
- **Editors:** Helix, Neovim, Vim, and Zed.
- **Terminals:** Ghostty, Kitty, WezTerm, and tmux.
- **CLI and TUI tools:** Starship, Yazi, Television, Lazygit, k9s, and Herdr.
- **AI tools:** Claude Code, Goose, and OpenCode.
- **Look and feel:** Catppuccin Frappé across supported tools, paired with JetBrainsMono Nerd Font Mono.

## Quick Start

### Prerequisites

- macOS
- [Homebrew](https://brew.sh/)
- Git
- GNU Stow

Install Stow with Homebrew:

```sh
brew install stow
```

Clone the repository into your home directory:

```sh
git clone git@github.com:lnw9jv/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

Review a package, then create its symlinks with Stow:

```sh
stow zsh
stow ghostty
stow neovim
```

Stow targets the parent directory by default, so running these commands from `~/.dotfiles` creates links below `$HOME`.

## Packages

### Shells and Prompt

| Package | Configuration |
| --- | --- |
| `bash` | `.bash_profile`, `.bashrc` |
| `fish` | `.config/fish/` |
| `nushell` | `.config/nushell/` |
| `starship` | `.config/starship.toml` |
| `zsh` | `.zshrc`, `.zshenv`, `.zprofile`, and custom plugins |

### Editors

| Package | Configuration |
| --- | --- |
| `helix` | `.config/helix/` |
| `neovim` | `.config/nvim/` |
| `vim` | `.vimrc` |
| `zed` | `.config/zed/` |

### Terminals and Multiplexers

| Package | Configuration |
| --- | --- |
| `ghostty` | `.config/ghostty/` |
| `kitty` | `.config/kitty/` |
| `tmux` | `.tmux.conf` |
| `wezterm` | `.config/wezterm/` |

### CLI and TUI Tools

| Package | Configuration |
| --- | --- |
| `fsh` | `.config/fsh/` |
| `herdr` | `.config/herdr/` |
| `k9s` | `.config/k9s/` |
| `lazygit` | `.config/lazygit/` |
| `tv` | `.config/television/` |
| `yazi` | `.config/yazi/` |

### AI Tools

| Package | Configuration |
| --- | --- |
| `claude-code` | `.claude/` |
| `goose` | `.config/goose/` |
| `opencode` | `.config/opencode/` |

## Maintenance

Install another package after cloning:

```sh
stow yazi
```

Refresh links after files or directories move inside a package:

```sh
stow --restow zsh
```

Remove a package's symlinks without deleting its source files:

```sh
stow --delete zsh
```

Preview what Stow would change before applying it:

```sh
stow --simulate --verbose zsh
```

## Notes

- These configurations are personal and opinionated. Review a package before linking it into your home directory.
- Existing files at a target path may conflict with Stow. Back them up or move them before installing the corresponding package.
- Applications are not installed automatically. Some configurations, including Zsh and Neovim, bootstrap plugin managers and may download dependencies when first started.
- Packages are intentionally independent, so install only the ones relevant to your setup.
