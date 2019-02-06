#!/usr/bin/env bash

# Script to install the codestyles to various IDEs

ZIP_NAME="bakdata-code-styles.zip"
DUMMY_DIR=".code-styles"
GIT_BRANCH="master"

# Get existing project code-styles
echo -e "Downloading code-styles...\n"
curl -H 'Cache-Control: no-cache' -Ls "https://github.com/bakdata/bakdata-code-styles/archive/$GIT_BRANCH.zip" > $ZIP_NAME

# Extract all code-styles for now
mkdir -p $DUMMY_DIR && unzip -qq $ZIP_NAME -d $DUMMY_DIR
BASE_DIR="$DUMMY_DIR/bakdata-code-styles-$GIT_BRANCH"

# Call IDE specific install scripts
for i in $BASE_DIR/*/install.sh;
do
  BASE_DIR=$BASE_DIR PROJECT_DIR=$(pwd) sh $i
done

rm -rf DUMMY_DIR