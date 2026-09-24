# .dotfiles

Dotfiles for Linux and MacOS.

## Contents

| Application                  | Description                                   |
| ---------------------------- | --------------------------------------------- |
| [Caveman](caveman/)          | Caveman plugin/skills settings.               |
| [Claude Code](claude/)       | Claude Code settings.                         |
| [Shell](shell/)              | Aliases and functions for zsh shell.          |
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

## Shell

Shortcuts for commonly used commands.

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

**Install shell aliases and functions with**:

```bash
echo "source ./shell/aliases.sh" >> ~/.zshrc
echo "source ./shell/docker/aliases.sh" >> ~/.zshrc
echo "source ./shell/functions.sh" >> ~/.zshrc
echo "source ./shell/functions/aliases.sh" >> ~/.zshrc
echo "source ./shell/settings.sh" >> ~/.zshrc
# or use
make shell
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
