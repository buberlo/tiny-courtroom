# Tiny Courtroom Makefile
#
# Common usage:
#   make install
#   make run
#   make test

.PHONY: install run test clean help
.DEFAULT_GOAL := help

VENV ?= .venv
PY := $(VENV)/bin/python
PIP := $(VENV)/bin/pip
APP := app.main:app
HOST ?= 0.0.0.0
PORT ?= 8000
PYTEST_ARGS ?=

install:
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -e .
	$(PIP) install pytest httpx

run:
	$(PY) -m uvicorn $(APP) --reload --host $(HOST) --port $(PORT)

test:
	$(PY) -m pytest $(PYTEST_ARGS) -q

clean:
	rm -rf $(VENV) .pytest_cache
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete

help:
	@echo "Tiny Courtroom Makefile"
	@echo ""
	@echo "  make install  Create $(VENV) and install runtime plus test dependencies."
	@echo "  make run      Start the FastAPI app with uvicorn on $(HOST):$(PORT)."
	@echo "  make test     Run the pytest suite."
	@echo "  make clean    Remove the virtualenv, pytest cache, and Python bytecode."
	@echo ""
	@echo "Variables:"
	@echo "  VENV=$(VENV)"
	@echo "  HOST=$(HOST)"
	@echo "  PORT=$(PORT)"
	@echo "  PYTEST_ARGS='$(PYTEST_ARGS)'"