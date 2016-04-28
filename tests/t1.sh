#!/usr/bin/env bash

. $TEST_DIR/bash-test.sh

test_expect_code_and_output 'bash $SRC_DIR/emptydir.sh' 1 \
  'usage: emptydir [-a] directory ...'
