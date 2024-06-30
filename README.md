# My Dotfiles

This repository contains my personal configuration files (dotfiles) for various tools and applications. It is inspired by [Dreams of Autonomys](https://www.youtube.com/watch?v=y6XCebnB9gs) & [Typecrafts](https://www.youtube.com/watch?v=NoFiYOqnC4o) Stow setup.

## Requirements

### Git

Linux & Windows (WSL)

```bash
sudo apt install git
```

MacOS

```bash
brew install git
```

### Stow

Linux & Windows (WSL)

```bash
sudo apt install stow
```

MacOS

```bash
brew install stow
```

## Installation

```bash
git clone https://github.com/Aquabbas/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow --target .
```

Check on your [Symlinks](https://www.gnu.org/software/libc/manual/html_node/Symbolic-Links.html):

```bash
ls -lah
```

## Issues

If you encounter conflicts stowing the files, consider:

- Writing over the pre-existing files:

```bash
stow --adopt .
```

- Moving the pre-existing files to a backup version.
  Ex:

```bash
mv ~/.config/tmux ~/.config/tmux.bak
stow .
```

- Deleting the pre-existing files (I would rather backup than delete, just in case).
  Ex:

```bash
rm -r ~/.config/tmux
```
