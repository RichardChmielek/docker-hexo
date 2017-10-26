#!/bin/bash
# Start script for hexo blog
git init
git remote add origin $origin
git fetch origin
git reset --hard origin/master
hexo server