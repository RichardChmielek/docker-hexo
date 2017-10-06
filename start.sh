#!/bin/bash
# Start script for hexo blog
git init
git remote add origin $HEXO_ORIGIN
git fetch origin
git reset --hard origin/master
hexo server