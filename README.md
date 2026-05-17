# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/) + Git.

## Structure

```
~/.dotfiles/
├── zsh/          → ~/.zshrc, ~/.zshenv
├── nvim/         → ~/.config/nvim/
├── tmux/         → ~/.tmux.conf
├── kitty/        → ~/.config/kitty/
├── starship/     → ~/.config/starship.toml
├── git/          → ~/.gitconfig
├── fastfetch/    → ~/.config/fastfetch/
├── lsd/          → ~/.config/lsd/
├── eza/          → ~/.config/eza/
└── desktop/      → ~/.local/share/applications/supKitty.desktop
```

---

## Prerequisites

Install these before bootstrapping.

### Required

| Package | Purpose |
|---|---|
| `git` | version control |
| `stow` | symlink manager |
| `zsh` | shell |
| `neovim` | editor |
| `tmux` | terminal multiplexer |
| `kitty` | terminal emulator |
| `starship` | shell prompt |
| `zoxide` | smarter `cd` |
| `eza` | modern `ls` replacement |
| `lsd` | another `ls` replacement |
| `fastfetch` | system info fetch |
| `bat` | `cat` with syntax highlighting (used in aliases) |

### Oh My Zsh + Plugins

```bash
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Optional

| Package | Purpose |
|---|---|
| `bun` | JS runtime (used in PATH) |
| `bat` | used by `batman` and `path` aliases |
| `net-tools` | used by `ports` alias (`netstat`) |
| `mpv` | used by `Xreboot` / `Xpoweroff` aliases |
| `asciiquarium` | used by `lake` alias |
| `quickemu` | used by VM aliases (`win10`, `archlinux`, etc.) |
| `cargo` / `rust` | used by `cr` and `cttlinutil` aliases |

---

## Bootstrap (New Machine)

```bash
# 1. Clone the repo
git clone git@github.com:ziad-2005/dotfiles.git ~/.dotfiles

# 2. Install Oh My Zsh + plugins (see above)

# 3. Stow everything
cd ~/.dotfiles
stow zsh nvim tmux kitty starship git fastfetch lsd eza desktop
```

### Neovim

Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim) and **auto-bootstrap on first launch** — just open `nvim` and wait.

### Tmux

No plugin manager. Pure config with a custom **Catppuccin Mocha** theme.

---

## Adding a New Config

```bash
cd ~/.dotfiles
mkdir -p <package>/.config/<tool>
mv ~/.config/<tool> <package>/.config/<tool>
stow <package>
git add . && git commit -m "feat: add <tool> config" && git push
```

## Removing a Package

```bash
cd ~/.dotfiles
stow -D <package>
```

## Updating on All Machines

```bash
cd ~/.dotfiles
git pull
```

Symlinks update automatically — no re-stowing needed.

---

## Notes

- `supKitty.desktop` launches kitty with `--config /dev/null` (zero config, pure defaults)
- Default `kitty` uses `~/.config/kitty/kitty.conf` automatically
- Machine-specific settings (like `PATH_TO_FX` for JavaFX) should go in `~/.zshrc.local` and sourced at the bottom of `.zshrc`
