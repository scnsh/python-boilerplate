PIP_COMPILE := pip-compile -q --no-emit-index-url
PY = python$(shell echo $(PYTHON_VERSION) | cut -d. -f -2)

venv: venv/bin/activate

venv/bin/activate:
	${PY} -m venv venv
	. venv/bin/activate; \
	pip install pip-tools


.PHONY: setup
setup: venv requirements/common.txt
	. venv/bin/activate; \
	pip install -r requirements/common.txt

requirements/common.txt: requirements/common.in
	${PIP_COMPILE} requirements/common.in --output-file requirements/common.txt

run:
	. venv/bin/activate; \
	${PY} main.py

ruff:
	ruff check .
