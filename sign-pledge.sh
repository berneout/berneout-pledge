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

sed --in-place -- "s!{{{PLEDGE}}}!The Berneout Pledge $edition!g" pledge
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

sed --in-place -- "s!{{{SIGNATURE}}}!$signature!g" pledge
sed --in-place -- "s!{{{TIMESTAMP}}}!$timestamp!g" pledge

git add pledge
git rm -f sign-pledge.sh
git rm -f README.md
git commit -m "Customize for @$user"

cat <<EOS
You have signed the pledge!

Two more steps to go:

1. Create the repository github.com/$user/berneout-pledge.

2. Push this Git repository there.
EOS
