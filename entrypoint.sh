#!/bin/sh -l

git clone --quiet https://github.com/$REPO &> /dev/null

echo "Generating commit range for the following tag range:"
echo $TAG_RANGE

changelog=$(generate-changelog $* --tag $TAG_RANGE --file -)

echo $changelog

changelog="${changelog//'%'/'%25'}"
changelog="${changelog//$'\n'/'%0A'}"
changelog="${changelog//$'\r'/'%0D'}"

echo "::set-output name=changelog::$changelog"
