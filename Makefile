UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S), Darwin)
  CONFIG_BASE := $(HOME)/Library/Application Support
else
  CONFIG_BASE := $(HOME)/.config
endif

.PHONY: vscode caveman claude
vscode:
	@if [ -z "$(TYPE)" ]; then \
		echo "Error: No TYPE provided. Usage: make vscode TYPE=[VSCodium|Code]"; \
		exit 1; \
	fi
	@sh ./scripts/install.sh vscode/settings.json $(CONFIG_BASE)/$(TYPE)/User user.json

caveman:
	@sh ./scripts/install.sh caveman/config.json $(CONFIG_BASE)/caveman config.json

claude:
	@sh ./scripts/install.sh claude/settings.json $(HOME)/.claude settings.json

.PHONY: install-caveman install-claude
install-caveman:
	npx skills add JuliusBrussee/caveman -g

install-claude:
	curl -fsSL https://claude.ai/install.sh | bash
