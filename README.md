# py-packaging-tutorial
Official Python Packaging Tutorial - my installation and notes

This is a simple example package. 

Tutorial URL: https://packaging.python.org/en/latest/tutorials/packaging-projects/#

#Usage

To reuse:
* fork/clone this repo
* replace damonreed in src/example_package_damonreed with your project name
* update pyproject.toml with your project particulars, set desired version
* create an account and api key at https://test.pypi.org/.  I recommend storing the API key in ~/.pypirc per the instructions when the key is created. (See also- https://packaging.python.org/en/latest/specifications/pypirc/#using-a-pypi-token)
* Follow the detailed instructions at https://packaging.python.org/en/latest/tutorials/packaging-projects/#
* I've also included a Makefile to document and automate the steps.  Run "make" then "make test" to see the magic.
* Multiple runs require incrementing the version in pyproject.toml

