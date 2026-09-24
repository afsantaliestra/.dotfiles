# .dotfiles

Dotfiles for Linux and MacOS.

## Contents

| Application                  | Description                                   |
| ---------------------------- | --------------------------------------------- |
| [Caveman](caveman/)          | Caveman plugin/skills settings.               |
| [Claude Code](claude/)       | Claude Code settings.                         |
| [Ghostty](ghostty/)          | Ghostty terminal settings.                    |
| [Shell](shell/)              | Aliases and functions for zsh shell.          |
| [VSCode - VSCodium](vscode/) | VSCode editor settings for projects and user. |
| [Packages](#Packages)        | Often used packages.                          |

## Caveman [GitHub](https://github.com/juliusbrussee/caveman)

Settings for caveman.

**Default location**:

- **Linux/MacOS**: `$HOME/.config/caveman/config.json`

**Commands**:

```bash
# Setup settings
make caveman-setup

# Install caveman
make caveman-install

# Setup and install
make caveman
```

## Claude Code [Docs](https://code.claude.com/docs)

Settings for claude code.

**Default location**:

- `Linux/MacOS`: `$HOME/.claude/settings.json`

**Commands**:

```bash
# Setup settings
make claude-setup

# Install claude
make claude-install

# Setup and install.
make claude
```

## Ghostty [GitHub](https://github.com/ghostty-org/ghostty)

Settings for Ghostty terminal.

**Default location**:

- `Linux/MacOS`: `$HOME/.config/ghostty/config`

**Commands**:

```bash
# Setup settings
make ghostty-setup
```

## Shell [zsh](https://www.zsh.org/) [oh-my-zsh GitHub](https://github.com/ohmyzsh/ohmyzsh)

Shortcuts for commonly used commands for zsh.

| Alias/Function | Command                                                                                                                                                                                             |
| -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `cls`          | `clear`                                                                                                                                                                                             |
| `dck`          | `docker`                                                                                                                                                                                            |
| `dc`           | `docker-compose`                                                                                                                                                                                    |
| `dcksc`        | `docker ps`                                                                                                                                                                                         |
| `dcksca`       | `docker ps -a`                                                                                                                                                                                      |
| `dcksi`        | `docker images`                                                                                                                                                                                     |
| `dcksv`        | `docker volume ls`                                                                                                                                                                                  |
| `dcksn`        | `docker network ls`                                                                                                                                                                                 |
| `dcks`         | `docker ps; echo ""; docker images; echo ""; docker volume ls; echo ""; docker network ls`                                                                                                          |
| `dckr`         | `docker restart`                                                                                                                                                                                    |
| `dckl`         | `docker logs -f --tail=50`                                                                                                                                                                          |
| `dckclsc`      | `docker rm -f $(docker ps -a)`                                                                                                                                                                      |
| `dckclsi`      | `docker rmi -f $(docker images -a )`                                                                                                                                                                |
| `dckclsv`      | `docker volume prune -f`                                                                                                                                                                            |
| `dckclsn`      | `docker network rm $(docker network ls -q)`                                                                                                                                                         |
| `dckcls`       | `dckclsc; echo ""; dckclsi; echo ""; dckclsv; echo ""; dckclsn`                                                                                                                                     |
| `dckclsp`      | `docker rm -f $(docker ps -aq); echo ""; docker rmi -f $(docker images -q); echo ""; docker volume prune -f; echo ""; docker network rm $(docker network ls -q); echo ""; docker builder prune -fa` |
| `dcke`         | `docker exec -it "$1" /bin/bash`                                                                                                                                                                    |
| `dckrl`        | `docker restart "$1"; docker logs -f --tail=50 "$1"`                                                                                                                                                |
| `dcknets`      | `docker ps -q \| xargs -n 1 docker inspect --format '{{ .Name }} {{range .NetworkSettings.Networks}} {{.IPAddress}}{{end}}' \| sed 's#^/##'`                                                        |

**Default location**:

- `Linux/MacOS`: `$HOME/.zshrc`

**Commands**:

```bash
# Setup aliases and functions
make shell-setup
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

**Commands**:

```bash
# Setup vscodium user settings.
make vscode-setup TYPE=VSCodium

# Setup vscode user settings.
make vscode-setup TYPE=Code
```

## Packages

Often used packages.

| package    | description                     | links                                            |
| ---------- | ------------------------------- | ------------------------------------------------ |
| `openspec` | Spec Driven Development toolkit | [GitHub](https://github.com/Fission-AI/openspec) |
| `spec-kit` | Spec Driven Development toolkit | [GitHub](https://github.com/github/spec-kit)     |

**Commands**:

```bash
make openspec-install
make speckit-install
```
