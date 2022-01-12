# actions-docs

[![Build](https://github.com/crazy-matt/action-docs/actions/workflows/docker_builder.yml/badge.svg)](https://github.com/crazy-matt/action-docs/actions/workflows/docker_builder.yml)
![Tests](https://github.com/crazy-matt/action-docs/blob/badges/tests.svg)
![Vulnerabilities](https://github.com/crazy-matt/action-docs/blob/badges/vulnerability.svg)

A dockerized [action-docs](https://github.com/npalm/action-docs) wrapper.

<details open="open">
<summary>Table of Contents</summary>

- [actions-docs](#actions-docs)
  - [Build History](#build-history)
  - [Usage](#usage)
    - [Generate an action documentation](#generate-an-action-documentation)
    - [Help](#help)
  - [Development](#development)
    - [Requirements](#requirements)
      - [Docker](#docker)
      - [asdf](#asdf)
      - [Task](#task)
      - [CI/CD Pipeline](#cicd-pipeline)
  - [License](#license)

</details>

## Build History

[![Build history](https://buildstats.info/github/chart/crazy-matt/action-docs?branch=main)](https://github.com/crazy-matt/action-docs/actions)

## Usage

### Generate an action documentation

```shell
docker run -it --rm -v $PWD:/work ghcr.io/crazy-matt/action-docs:latest
docker run -it --rm -v $PWD:/work ghcr.io/crazy-matt/action-docs:latest <command>
```

### Help

```shell
docker run -it --rm -v $PWD:/work ghcr.io/crazy-matt/action-docs:latest --help
```

> For any other `action-docs` command, check-out the initial [documentation](https://github.com/npalm/action-docs#readme).

## Development

### Requirements

#### Docker

See [website](https://www.docker.com/)

#### asdf

[asdf](https://asdf-vm.com/) is a great multi-package version manager being used in this repository to install some local dependencies when needed. But feel free to use any other version manager you like.

`.tool-versions` lists those dependencies.

You can install `asdf` by following the instructions [here](http://asdf-vm.com/guide/getting-started.html#_1-install-dependencies).

> You might need to add `asdf` into your `$PATH` if you installed it via Homebrew. In your `.bashrc` (or whatever .rc file you're using) add:
>
> ```bash
> export PATH="$PATH:/usr/local/var/homebrew/linked/asdf/bin:$HOME/.asdf/shims"
> ```

#### Task

[Task](https://taskfile.dev/#/) is a great shell commands bootstrap solution (like `Make` but in Yaml) permitting you to make the same calls locally (for development phases) and within the CI/CD pipeline.

You want to get familiar with it? Read [this](https://tsh.io/blog/taskfile-and-gnu-make-for-automation/).

You can install it that way:

```bash
asdf plugin add task
cd ./bats-action
asdf install task $(asdf current task | tr -s ' ' | cut -d' ' -f2)
task list
```

#### Dependencies

Run `task dependencies`.

#### CI/CD Pipeline

This [GitHub workflow](.github/workflows/docker_builder.yml) ensure a daily check of the [action-docs](https://github.com/npalm/action-docs) [releases](https://github.com/npalm/action-docs/releases) and automatically build the docker image.

## License

Licensed under the [Apache License 2.0](LICENSE)
