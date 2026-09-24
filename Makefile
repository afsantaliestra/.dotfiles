UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S), Darwin)
  CONFIG_BASE := $(HOME)/Library/Application Support
else
  CONFIG_BASE := $(HOME)/.config
endif

.PHONY: caveman claude
caveman: caveman-setup caveman-install
claude: claude-setup claude-install

.PHONY: caveman-setup claude-setup ghostty-setup shell-setup vscode-setup
caveman-setup:
	@echo "Setup caveman settings."
	@sh ./.scripts/setup.sh caveman/config.json $(CONFIG_BASE)/caveman config.json

claude-setup:
	@echo "Setup claude settings."
	@sh ./.scripts/setup.sh claude/settings.json $(HOME)/.claude settings.json

ghostty-setup:
	@echo "Setup ghostty settings."
	@sh ./.scripts/setup.sh "$(CURDIR)/ghostty/config" $(CONFIG_BASE)/ghostty config append

shell-setup:
	@echo "Appending shell settings to `.zshrc` file."
	@sh ./.scripts/setup.sh "$(CURDIR)/shell/zsh.sh" $(HOME) .zshrc append

vscode-setup:
	@echo "Setup $(TYPE) user settings."
	@if [ -z "$(TYPE)" ]; then \
		echo "Error: No TYPE provided. Usage: make vscode TYPE=[VSCodium|Code]"; \
		exit 1; \
	fi
	@sh ./.scripts/setup.sh vscode/settings.json $(CONFIG_BASE)/$(TYPE)/User user.json

.PHONY: caveman-install claude-install openspec-install speckit-install
caveman-install:
	@echo "Install caveman skills."
	npx skills add JuliusBrussee/caveman -g

claude-install:
	@echo "Install claude code cli."
	curl -fsSL https://claude.ai/install.sh | bash

openspec-install:
	@echo "Install openspec."
	@npm i -g @fission-ai/openspec

speckit-install:
	@echo "Install spec-kit."
	@uv tool install specify-cli
