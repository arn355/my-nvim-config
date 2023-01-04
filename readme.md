# My Neovim Configuration

This is configuration for my neovim.

## Requirements

Node **(Required)**

- [node](https://nodejs.org/en/download/)

To install telescope fuzzy finder plugin **(Required)**

- [gcc](https://www.mingw-w64.org/) (make sure that gcc and neovim have the save architecture ex. gcc x64 and nvim x64)
- [make](https://www.gnu.org/software/make/)
- [fzf](https://github.com/junegunn/fzf)

To fix error with tree-sitter executable not found **(Required)**

- [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md)

To make better telescope fuzzy finder performance **(Recommended)**

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)

To use lazygit in toggle terminal and all usage **(Optional)**

- [lazygit](https://github.com/jesseduffield/lazygit)

To use C# parser and run C# based program **(Optional)**

- [dotnet-sdk](https://dotnet.microsoft.com/en-us/download)

To use autopep8 (python formatter) and python **(Optional)**

### Shortcut for Window

#### install via scoop

```ps
scoop bucket add extras
scoop install gcc make fzf ripgrep fd tree-sitter lazygit dotnet-sdk nodejs-lts python
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
