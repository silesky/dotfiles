#!/bin/sh
git checkout --detach
git fetch origin '+refs/heads/*:refs/heads/*'
git checkout -
