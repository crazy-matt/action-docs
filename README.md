# action-docs

[![Tests](https://github.com/crazy-matt/action-docs/blob/badges/tests.svg)](https://github.com/crazy-matt/action-docs/actions/workflows/test.yml)
[![Vulnerabilities](https://github.com/crazy-matt/action-docs/blob/badges/vulnerabilities.svg)](https://github.com/crazy-matt/action-docs/actions/workflows/ci.yml)
[![Release](https://github.com/crazy-matt/action-docs/blob/badges/release.svg)](https://github.com/crazy-matt/action-docs/actions/workflows/release.yml)

A dockerized [action-docs](https://github.com/npalm/action-docs).

## Usage

__Generate an action documentation__

```shell
docker run -t --rm -v $PWD:/work ghcr.io/crazy-matt/action-docs:latest --update-readme
```

__Help__

```shell
docker run -t --rm -v $PWD:/work ghcr.io/crazy-matt/action-docs:latest --help
```

> Check-out the `action-docs` documentation [here](https://github.com/npalm/action-docs#readme).
