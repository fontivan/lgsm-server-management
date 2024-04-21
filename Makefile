# Makefile derived from https://web.archive.org/web/20240205205603/https://venthur.de/2021-03-31-python-makefiles.html

# Get the directory this Makefile is sitting in
ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

# system python interpreter. used only to create virtual environment
PY = python3
VENV = venv
BIN=$(ROOT_DIR)/$(VENV)/bin

all: ansible-lint ansible-syntax-check

$(VENV): requirements/ci.txt requirements/usage.txt requirements/ansible-galaxy.yaml
	$(PY) -m venv $(VENV)
	$(BIN)/pip install --upgrade -r requirements/ci.txt
	$(BIN)/pip install --upgrade -r requirements/usage.txt
	$(BIN)/ansible-galaxy install -r requirements/ansible-galaxy.yaml
	touch $(VENV)

.PHONY: ansible-lint
ansible-lint: $(VENV)
	(cd ansible && $(BIN)/ansible-lint)

.PHONY: ansible-syntax-check
ansible-syntax-check: $(VENV)
	(cd ansible && $(BIN)/ansible-playbook playbooks/playbook.yaml --syntax-check)

clean:
	rm -rf $(VENV)
	find . -type f -name *.pyc -delete
	find . -type d -name __pycache__ -delete
