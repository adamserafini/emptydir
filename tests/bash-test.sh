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
  for filename in $TEST_DIR/t[0-9]*.sh
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
  # Function takes 3 parameters:
  # - the bash command to be run
  # - the expected code
  # - the expected output

  # Test for correct parameters and exit test suite if not given.
  test "$#" = 3 || error "test_expect_code_and_output requires 3 parameters."

  expected_code=$2
  expected_output=$3

  # Run the command and store the resulting output and code.
  actual_output=$(eval $1)
  actual_code=$?

  if [[ $actual_code -ne $expected_code ]]; then
    return 1
  fi

  if [[ "$actual_output" != "$expected_output" ]]; then
    return 1
  fi
}

# Only 'run' the tests if this script is called directly:
RUNNING="$(basename $0)"

if [[ "$RUNNING" == "bash-test.sh" ]]
then
  run "$@"
fi
