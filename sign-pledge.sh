#!/bin/bash

read -p "Enter your GitHub user name, without @: " user

sed --in-place -- "s!{{{GITHUB_USER_NAME}}}!$user!g" pledge

cat <<EOS

########################################################################

EOS

head -n -3 pledge

cat <<EOS
########################################################################
# To sign the pledge, type your name between slashes like /Casey Yao/. #
# If you don't want to sign, press Control + C to exit.                #
########################################################################

EOS
read -p "Signed: " signature
timestamp=$(date --utc --iso-8601=minutes)

sed --in-place -- "s!{{{SIGNATURE}}}!$signature!g" pledge
sed --in-place -- "s!{{{TIMESTAMP}}}!$timestamp!g" pledge

git add pledge
git rm -f sign-pledge.sh
git rm -f sign-pledge.bat
git rm -f README.md
git commit -m "Customize for @$user"

cat <<EOS

You have signed The Berneout Pledge!

Two more steps to go:

1. Create the repository github.com/$user/berneout-pledge.

2. Push this Git repository there.

EOS
