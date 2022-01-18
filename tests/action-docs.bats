#!/usr/bin/env libs/bats-core/bin/bats
load 'libs/bats-assert/load.bash'
load 'libs/bats-file/load.bash'
load 'libs/bats-mock/stub.bash'
load 'libs/bats-support/load.bash'
load 'libs/helpers/load.bash'

function setup() {
  # See https://bats-core.readthedocs.io/en/stable/writing-tests.html#special-variables
  REPO_ROOT_DIR="$BATS_TEST_DIRNAME/../"
}

# function teardown() {
# }

@test "image entrypoint" {
  run bash -c "docker inspect ghcr.io/crazy-matt/action-docs:1.0.3 | jq -r '.[].Config.Entrypoint[]'"
  assert_success
  assert_output "/usr/local/bin/action-docs"
}

@test "version installed" {
  echo "$BUILD_VERSION"
  run docker run -t --rm ${IMAGE} "--version"
  assert_success
  assert_line --index 0 --partial "$BUILD_VERSION"
}

@test "helper" {
  run docker run -t --rm ${IMAGE} "--help"
  assert_success
  assert_output --partial 'Options:'
  assert_output --partial 'Show help'
  assert_output --partial 'Show version number'
}
