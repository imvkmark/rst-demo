#!/usr/bin/env bash

os='';
fun_os() {
    if [ "$(uname)" == 'Darwin' ]; then
        os='Mac'
    else
        os='Linux'
    fi
    return 0;
}
fun_os
echo $os;