#!/bin/bash

edition=$(git tag -l --points-at HEAD 2>/dev/null)

timestamp=$(date --utc --iso-8601=minutes)

read -p "Enter you GitHub user name, without @: " user
read -p "Sign your name by typing it between /slashes/: " signature

sed --in-place -- "s!{{{GITHUB_USER_NAME}}}!$user!g" pledge
sed --in-place -- "s!{{{SIGNATURE}}}!$signature!g" pledge
sed --in-place -- "s!{{{TIMESTAMP}}}!$timestamp!g" pledge

if [ -n "$edition" ]; then
  sed --in-place -- "s!{{{PLEDGE}}}!The Berneout Pledge $edition!g" pledge
fi

git add pledge
git commit -m "Customize for @$user"
