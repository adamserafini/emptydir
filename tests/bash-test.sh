#!/usr/bin/env bash

# (c) Adam Serafini 2016

# An ad-hoc library for testing bash CLI projects. It is loosely modelled on on
# the test suite for todo.txt
# https://github.com/ginatrapani/todo.txt-cli/tree/master/tests

# Export the test directory:
export TEST_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Export the source directory:
export SRC_DIR="$(dirname "$TEST_DIR")"

run() {
  # Iterate through all files that match the test pattern.
  for filename in $TEST_DIR/t[0-9]*-*.sh
  do
    $filename
  done

  exit 1
}

error () {
  echo "error: $*"
  exit 1
}

test_expect_code_and_output() {
  test "$#" = 3 || error "test_expect_code_and_output requires 3 parameters."
}

# Only 'run' the tests if this script is called directly:
RUNNING="$(basename $0)"

if [[ "$RUNNING" == "bash-test.sh" ]]
then
  run "$@"
fi
