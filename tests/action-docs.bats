#!/usr/bin/env bats
load /opt/bats-assert/load.bash
load /opt/bats-file/load.bash
load /opt/bats-mock/stub.bash
load /opt/bats-support/load.bash
load /opt/helpers/load.bash

function setup() {
  # See https://bats-core.readthedocs.io/en/stable/writing-tests.html#special-variables
  REPO_ROOT_DIR="$BATS_TEST_DIRNAME/../"
}

# function teardown() {
# }

@test "image entrypoint" {
  run bash -c "docker inspect ${IMAGE_NAME} | jq -r '.[].Config.Entrypoint[]'"
  assert_success
  assert_output "/usr/local/bin/action-docs"
}

@test "version installed" {
  run docker run -it --rm ${IMAGE_NAME} "--version"
  assert_success
  assert_line --index 0 --partial "$BUILD_VERSION"
}

@test "helper" {
  run docker run -it --rm ${IMAGE_NAME} "--help"
  assert_success
  assert_output --partial 'Options:'
  assert_output --partial 'Show help'
  assert_output --partial 'Show version number'
}
