CWD := $(shell pwd)

.PHONY: all
all: build

.PHONY: start
start:
	@bundle exec jekyll serve --verbose

.PHONY: build
build: clean
	@gem build *.gemspec
	@echo ::: BUILD :::

.PHONY: install
install: deps
	-@rm -f Gemfile.lock &>/dev/null || true
	@bundle install
	@echo ::: INSTALL :::

.PHONY: push
push: build
	@gem push *.gem
	@echo ::: PUSH :::

.PHONY: clean
clean:
	-@rm -rf *.gem &>/dev/null || true
	@echo ::: CLEAN :::

.PHONY: deps
deps: bundle
	@echo ::: DEPS :::
.PHONY: bundle
bundle:
	@if ! o=$$(which bundle); then gem install bundle jekyll; fi
