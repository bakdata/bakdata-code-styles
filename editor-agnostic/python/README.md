# Python

## Tools

### Ruff

[Ruff](https://docs.astral.sh/ruff/) is an extremely fast Python linter, written in Rust.

#### Install

`pip install ruff`

#### Config

Ruff can be configured through a `pyproject.toml`, `ruff.toml`, or `.ruff.toml` file. Here we store the configuration in `ruff.toml`, but it can be easily transferred to a `pyproject.toml` by putting each section under `[tool.ruff]`. Find more details in the [official docs](https://docs.astral.sh/ruff/configuration/).

### Black

[Black](https://github.com/psf/black) is a PEP 8 compliant opinionated formatter.

#### Install

`pip install black`

#### Config

We use the default configuration. To customize Black's behavior see the [official docs](https://black.readthedocs.io/en/stable/usage_and_configuration/index.html).

### Pyright

[Pyright](https://microsoft.github.io/pyright/#/) is a full-featured, standards-based static type checker for Python.

#### Install

`pip install pyright`

#### Config

We use the default configuration. To customize Pyright's behavior refer to the [official docs](https://microsoft.github.io/pyright/#/configuration).
