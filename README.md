# python-boilerplate
python プロジェクトの template

以下を設定してます。
- rye + vscode
- ruff (linter, formatter)
- mypy (type-check)
- pre-commit (ruff check を commit 前に実行するため)

## vscode
以下の拡張機能を使っています
- Python: "ms-python.python"
- Pylance: "ms-python.vscode-pylance"
- Ruff: "charliermarsh.ruff"
- Mypy: "ms-python.mypy-type-checker"

以下の拡張機能は競合になるので無効化を推奨
- Black: "ms-python.black-formatter"
- Isort: "ms-python.isort"
- flake8: "ms-python.flake8"

## usage

### 1. setup

```bash
# python バージョンを設定する(.python-versionが書き換わる)
$ rye pin 3.8

# 以下が生成される
#  .venv: 仮想環境
#  requirements-dev.lock: 開発用ライブラリのロックファイル
#  requirements.lock:  本番用ライブラリのロックファイル
$ rye sync

# pre-commitの設定
#  "rye sync"で pre-commit のインストールは完了している
#  .pre-commit-config.yamlを事前に用意しておく
$ pre-commit install
```

### 2. commands

```bash
# ruff と mypy を実行
$ rye run lint

# フォーマット実行(ruff)
$ rye run format

# pytestを実行
$ rye run test

# プログラムの実行
$ rye run python-boilerplate
```
