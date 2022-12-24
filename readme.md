# My Neovim Configuration

This is configuration for my neovim.

## Requirements

To install telescope fuzzy finder plugin (Required)

- gcc (make sure that gcc and neovim have the save architecture ex. gcc x64 and nvim x64)
- make
- fzf

To make better telescope fuzzy finder performance (Recommended)

- ripgrep
- fd

To use lazygit in toggle terminal and all usage (Optional)

- lazygit

### Window

#### install via scoop

```ps
scoop install gcc make fzf ripgrep fd
```

### MacOS

#### install via Homebrew

```bash
brew install gcc make fzf ripgrep fd
```

### Linux (Debian-Based)

#### install via apt

```bash
sudo apt install gcc make fzf ripgrep fd-find
```

## Install the configuration

Make sure you not have nvim folder in your config path

### Window

```ps
git clone https://github.com/arn355/my-nvim-config.git $HOME\AppData\Local\nvim
```

### MacOS / Linux

```bash
git clone https://github.com/arn355/my-nvim-config.git ~/.config/nvim
```
