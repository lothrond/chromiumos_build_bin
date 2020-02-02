#!/bin/bash

GIT_USER=""
GIT_EMAIL=""

git config --global user.name "$GIT_USER"
git config --global user.email "$GIT_EMAIL"
git config --global core.autocrlf false
git config --global core.filemode false
# and for fun!
git config --global color.ui true
