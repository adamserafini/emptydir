#!/usr/bin/env bash

. $DIR/bash-test.sh

test_expect_code_and_output 0 1 2 3
