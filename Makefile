ENV_NAME ?= hw3
ENV_YML  ?= environment.yml

.PHONY: env html clean

env:
	@echo ">> Creating or updating conda env '$(ENV_NAME)' from $(ENV_YML)"
	@if conda env list | grep -q "^\($(ENV_NAME)\)\s"; then \
		conda env update -n $(ENV_NAME) -f $(ENV_YML); \
	else \
		conda env create -n $(ENV_NAME) -f $(ENV_YML); \
	fi
	@echo ">> Done. (Not activating the env)"

html:
	@echo ">> Building MyST site locally (HTML)"
	myst build --html
	@echo ">> Built to _build/html"

clean:
	@echo ">> Cleaning outputs"
	rm -rf figures audio _build
	@echo ">> Clean complete"
