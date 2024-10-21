# PIP_COMPILE := pip-compile -q --no-emit-index-url
# PY = python$(shell cat .python-version | cut -d. -f -2)

# venv環境は明示的に作らなくて良い
# venv: venv/bin/activate

# venv/bin/activate:
# 	${PY} -m venv venv
# 	. venv/bin/activate; \
# 	pip install pip-tools

# setup をわざわざ呼ばなくて良い(ただし、pre-commit install は必要)
#.PHONY: setup
# setup: venv requirements/common.txt
# 	. venv/bin/activate; \
# 	pip install -r requirements/common.txt; \
# 	pre-commit install

# requirementsファイルの更新は不要となり、追加する場合は以下の手順で行う
# 1. パッケージを新規で追加する場合は、uv add コマンドを利用する
#    e.g. uv add 'httpx>0.1.0'
# 2. パッケージをアップデートしたい場合は、以下のように記述する
#    e.g. uv add 'httpx>0.1.0' --upgrade-package httpx
# 3. 削除するときは以下のように記述する
#    e.g. uv remove httpx

# requirements/common.txt: requirements/common.in
# 	${PIP_COMPILE} requirements/common.in --output-file requirements/common.txt

# 'uv run' を実行することで、プロジェクト環境(venv)を読み込んで実行する
run:
	uv run main.py

# 'uvx(=uv tool run)' を実行することで、isolated(プロジェクト環境外)として、一時的なインストールによってruffを実行できる
ruff:
	uvx --python $(shell cat .python-version) ruff check .
