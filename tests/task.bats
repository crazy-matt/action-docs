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

@test "task docker:semver1_greater_than_semver2" {
  SEMVER1="1.0.1" SEMVER2="1.0.0" run task docker:semver1_greater_than_semver2
  assert_success
  assert_output "true"
  
  SEMVER1="1.0.0" SEMVER2="1.0.0" run task docker:semver1_greater_than_semver2
  assert_success
  assert_output "false"

  SEMVER1="1.0.0" SEMVER2="1.0.1" run task docker:semver1_greater_than_semver2
  assert_success
  assert_output "false"

  SEMVER1="1.0.1" SEMVER2="1.0.0" FORCE="true" run task docker:semver1_greater_than_semver2
  assert_success
  assert_output "true"

  SEMVER1="1.0.0" SEMVER2="1.0.0" FORCE="true" run task docker:semver1_greater_than_semver2
  assert_success
  assert_output "true"

  SEMVER1="1.0.0" SEMVER2="1.0.1" FORCE="true" run task docker:semver1_greater_than_semver2
  assert_success
  assert_output "true"

  SEMVER1="1.0.1" SEMVER2="1.0.0" FORCE="false" run task docker:semver1_greater_than_semver2
  assert_success
  assert_output "true"

  SEMVER1="1.0.0" SEMVER2="1.0.0" FORCE="false" run task docker:semver1_greater_than_semver2
  assert_success
  assert_output "false"

  SEMVER1="1.0.0" SEMVER2="1.0.1" FORCE="false" run task docker:semver1_greater_than_semver2
  assert_success
  assert_output "false"

  SEMVER1="1.0.0" SEMVER2= FORCE= run task docker:semver1_greater_than_semver2
  assert_success
  assert_output "true"
}
