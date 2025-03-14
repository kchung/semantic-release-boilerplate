#!/usr/bin/env bash

# Forked from https://github.com/PaulRBerg/foundry-template/blob/c74318/.github/scripts/rename.sh

# https://gist.github.com/vncsna/64825d5609c146e80de8b1fd623011ca
set -euo pipefail

# Define the input vars
GITHUB_REPOSITORY=${1?Error: Please pass username/repo}
GITHUB_REPOSITORY_OWNER=${2?Error: Please pass username}
GITHUB_REPOSITORY_DESCRIPTION=${3:-""} # If null then replace with empty string

echo "GITHUB_REPOSITORY: $GITHUB_REPOSITORY"
echo "GITHUB_REPOSITORY_OWNER: $GITHUB_REPOSITORY_OWNER"
echo "GITHUB_REPOSITORY_DESCRIPTION: $GITHUB_REPOSITORY_DESCRIPTION"

# jq is like sed for JSON data
JQ_OUTPUT=$(jq \
  --arg NAME "@$GITHUB_REPOSITORY" \
  --arg AUTHOR_NAME "$GITHUB_REPOSITORY_OWNER" \
  --arg URL "https://github.com/$GITHUB_REPOSITORY_OWNER" \
  --arg DESCRIPTION "$GITHUB_REPOSITORY_DESCRIPTION" \
  --arg REPO_URL "https://github.com/$GITHUB_REPOSITORY" \
  --arg BUGS_URL "https://github.com/$GITHUB_REPOSITORY/issues" \
  --arg REPO_GIT_URL "git+https://github.com/$GITHUB_REPOSITORY.git" \
  '.name = $NAME 
  | .description = $DESCRIPTION 
  | .author |= ( .name = $AUTHOR_NAME | .url = $URL ) 
  | .homepage = "\($REPO_URL)#readme" 
  | .bugs.url = $BUGS_URL 
  | .repository |= ( .type = "git" | .url = $REPO_GIT_URL )' \
  package.json)

# Overwrite package.json
echo "$JQ_OUTPUT" > package.json
