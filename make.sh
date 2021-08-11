#!/usr/bin/env bash
make html
wkd=$(cd "$(dirname "$0")" && pwd)
mkdir "$wkd/docs"
cp -r "$wkd/_build/html/" "$wkd/_build/docs/"
git add --all
git commit -m 'auto docs'
git push