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
PACKAGE_NAME := py_packaging_tutorial

all: build

build: $(VENV_NAME)
	$(VENV_NAME)/bin/python build

clean:
	rm -rf build dist $(PROJECT_NAME).egg-info

install: $(VENV_NAME)
	$(VENV_NAME)/bin/python setup.py install

uninstall:
	pip uninstall -y $(PROJECT_NAME)

$(VENV_NAME):
	$(PYTHON) -m venv $(VENV_NAME)
	$(VENV_NAME)/bin/pip install --upgrade pip build twine
	-f requirements.txt && $(VENV_NAME)/bin/pip install -r requirements.txt



