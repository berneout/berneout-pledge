#!/bin/bash

edition=$(git tag -l --points-at HEAD 2>/dev/null)

if [ -z "$edition" ]; then
cat > /dev/stderr <<-EOS
This is not an official edition of The Berneout Pledge!  Please visit
https://github.com/berneout/berneout-pledge for the latest edition!
EOS
exit 1
fi

timestamp=$(date --utc --iso-8601=minutes)

read -p "Enter you GitHub user name, without @: " user
read -p "Sign your name by typing it between /slashes/: " signature

sed --in-place -- "s!{{{GITHUB_USER_NAME}}}!$user!g" pledge
sed --in-place -- "s!{{{SIGNATURE}}}!$signature!g" pledge
sed --in-place -- "s!{{{TIMESTAMP}}}!$timestamp!g" pledge
sed --in-place -- "s!{{{PLEDGE}}}!The Berneout Pledge $edition!g" pledge

git add pledge
git rm -f sign-the-pledge.sh
git commit -m "Customize for @$user"

less pledge

cat <<EOS
You have signed the pledge!

Two more steps to go:

1. Create the repository github.com/$user/berneout-pledge.

2. Push this Git repository there.
EOS
