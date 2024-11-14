 # Dependencies

 - ripgrep
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
    sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
 - Python >= 3.9
 - ruff: pip install ruff
 - PyNvim: pip install pynvim

 # Neovim Configuration: (for macOS)

This repository contains my fully customized Neovim configuration.

---

# Colorscheme:
I use the catpuccin colorscheme for an appealing visual experience.

---

# LSP (Language Servers Protocol):
Mason is employed to manage and install all necessary LSP servers, including python, JavaScript, Lua, and Markdown.

---

# Essential Plugins:

## Telescope:
A powerful, versatile fuzzy finder that offers quick navigation.

## Copilot:
Leverages GitHub's Copilot for enhanced coding capabilities.

## Treesitter:
Delivers exceptional autocompletion functionality.

## Lazygit:
Integrated Git plugin, enabling push/pull/commit commands within Neovim.

## Autopairs:
Automatically generates and completes symbol pairs like brackets as you type.
