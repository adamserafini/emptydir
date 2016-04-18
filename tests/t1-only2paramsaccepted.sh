#!/usr/bin/env bash

. $TEST_DIR/bash-test.sh

test_expect_code_and_output 0 1 2 3
