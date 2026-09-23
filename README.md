# .dotfiles

Dotfiles for Linux, MacOS and Windows.

## Contents

| Application                  | Description                                   |
| ---------------------------- | --------------------------------------------- |
| [VSCode - VSCodium](vscode/) | VSCode editor settings for projects and user. |

## VSCode - VSCodium

Settings include:

- `user.json` to be placed at user vscode configuration path.
  - **VSCodium paths**
    - Linux: `$HOME/.config/VSCodium/User/settings.json`
    - MacOS: `$HOME/Library/Application\ Support/VSCodium/User/settings.json`
    - Windows: `%APPDATA%\VSCodium\User\settings.json`
  - **VSCode paths**
    - Linux: `$HOME/.config/Code/User/settings.json`
    - MacOS: `$HOME/Library/Application\ Support/Code/User/settings.json`
    - Windows: `%APPDATA%\Code\User\settings.json`
- `python` to be placed at projects root at '.vscode. It contains:
  - `extensions.json` with recomended extensions for python projects.
  - `settings.json` with recomended settings for python projects.
