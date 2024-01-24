#
# Makefile for the py-packaging-tutorial project.
#
# Targets:
#   all:        Build the project.
#   clean:      Remove all build artifacts.
#   install:    Install the project.
#   uninstall:  Uninstall the project.

PROJECT_NAME := py-packaging-tutorial
VENV_NAME := venv
PYTHON := python3
PACKAGE_NAME := example_package_damonreed
TEST_PATH := tests

all: clean build upload

clean:
	rm -rf dist $(VENV_NAME) $(TEST_PATH)/$(VENV_NAME)

build: $(VENV_NAME)
	$(VENV_NAME)/bin/python -m build

upload: build
	$(VENV_NAME)/bin/twine upload --repository testpypi dist/*

$(VENV_NAME):
	$(PYTHON) -m venv $(VENV_NAME)
	$(VENV_NAME)/bin/pip install --upgrade pip build twine
	# if requirements.txt exists, install it
	# test -f requirements.txt && $(VENV_NAME)/bin/pip install -r requirements.txt

test: $(VENV_NAME)
	cd $(TEST_PATH) && \
	$(PYTHON) -m venv $(VENV_NAME) && \
	$(VENV_NAME)/bin/pip install --upgrade pip && \
	$(VENV_NAME)/bin/pip install --index-url https://test.pypi.org/simple/ --no-deps $(PACKAGE_NAME) && \
	$(VENV_NAME)/bin/pip install pytest && \
	$(VENV_NAME)/bin/pytest --verbose
	rm -rf $(TEST_PATH)/$(VENV_NAME)


