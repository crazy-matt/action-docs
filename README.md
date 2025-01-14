# action-docs

[![Integration](https://github.com/crazy-matt/action-docs/actions/workflows/integration.yaml/badge.svg)](https://github.com/crazy-matt/action-docs/actions/workflows/integration.yaml)
[![Image Tests](https://github.com/crazy-matt/action-docs/blob/badges/tests.svg)](https://github.com/crazy-matt/action-docs/actions/workflows/release.yaml)
[![Release](https://github.com/crazy-matt/action-docs/blob/badges/release.svg)](https://github.com/crazy-matt/action-docs/actions/workflows/release.yaml)

A dockerized [action-docs](https://github.com/npalm/action-docs).

## Usage

### Generate an action documentation

```shell
docker run --rm -v $PWD:/work ghcr.io/crazy-matt/action-docs:latest --update-readme
```

### Help

```shell
docker run --rm -v $PWD:/work ghcr.io/crazy-matt/action-docs:latest --help
```

> Check-out the `action-docs` documentation [here](https://github.com/npalm/action-docs#readme).

### Release Cycle

The Docker image tags now match the [action-docs](https://github.com/npalm/action-docs) versions and should be available in less than 24 hours.
