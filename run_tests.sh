#!/bin/sh

# @todo use timeout
# @todo use test classes

test_template=$(/bin/sh $PWD/test.sc.template);

printf "%s" "$test_template" >> "$PWD/test.sc"

sclang test.sc

exit $?
