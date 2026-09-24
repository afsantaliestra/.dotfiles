# .dotfiles

Dotfiles for Linux and MacOS.

## Contents

| Application                  | Description                                   |
| ---------------------------- | --------------------------------------------- |
| [Caveman](caveman/)          | Caveman plugin/skills settings.               |
| [Claude Code](claude/)       | Claude Code settings.                         |
| [VSCode - VSCodium](vscode/) | VSCode editor settings for projects and user. |

## Caveman [GitHub](https://github.com/juliusbrussee/caveman)

Settings for caveman.

**Default location**:

- **Linux**: `$HOME/.config/caveman/config.json`
- **MacOS**: `$HOME/Library/Application Support/caveman/config.json`

Install caveman with:

```bash
npx skills add JuliusBrussee/caveman -g
# or use
make install-caveman
```

## Claude Code [Docs](https://code.claude.com/docs)

Settings for claude code.

**Default location**:

- `Linux`: `$HOME/.claude/settings.json`
- `MacOS`: `$HOME/.claude/settings.json`

**Install claude-code with**:

```bash
curl -fsSL https://claude.ai/install.sh | bash
# or use
make install-claude
```

## VSCodium [GitHub](https://github.com/vscodium/vscodium) - VSCode [GitHub](https://github.com/microsoft/vscode)

Settings for VSCodium/VSCode, for both user and projects.

**Default location for user configuration**:

**VSCodium paths**

- Linux: `$HOME/.config/VSCodium/User/settings.json`
- MacOS: `$HOME/Library/Application\ Support/VSCodium/User/settings.json`

**VSCode paths**

- Linux: `$HOME/.config/Code/User/settings.json`
- MacOS: `$HOME/Library/Application\ Support/Code/User/settings.json`
