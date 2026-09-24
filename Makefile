UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S), Darwin)
  CONFIG_BASE := $(HOME)/Library/Application Support
else
  CONFIG_BASE := $(HOME)/.config
endif

.PHONY: caveman claude shell vscode
caveman:
	@sh ./scripts/install.sh caveman/config.json $(CONFIG_BASE)/caveman config.json

claude:
	@sh ./scripts/install.sh claude/settings.json $(HOME)/.claude settings.json

shell:
	@echo "Appending aliases and functions to .zshrc file."
	@echo "source $(CURDIR)/shell/aliases.sh" >> ~/.zshrc
	@echo "source $(CURDIR)/shell/docker/aliases.sh" >> ~/.zshrc
	@echo "source $(CURDIR)/shell/functions.sh" >> ~/.zshrc
	@echo "source $(CURDIR)/shell/docker/functions.sh" >> ~/.zshrc
	@echo "source $(CURDIR)/shell/settings.sh" >> ~/.zshrc

vscode:
	@if [ -z "$(TYPE)" ]; then \
		echo "Error: No TYPE provided. Usage: make vscode TYPE=[VSCodium|Code]"; \
		exit 1; \
	fi
	@sh ./scripts/install.sh vscode/settings.json $(CONFIG_BASE)/$(TYPE)/User user.json

.PHONY: install-caveman install-claude
install-caveman:
	npx skills add JuliusBrussee/caveman -g

install-claude:
	curl -fsSL https://claude.ai/install.sh | bash
