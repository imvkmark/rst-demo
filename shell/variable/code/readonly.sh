#!/usr/bin/env bash

rword="hello"
echo ${rword}
# Output: hello

readonly rword
rword="bye"  # 执行时会报错
# readonly.sh: line 8: rword: readonly variable
