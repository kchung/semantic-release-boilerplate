# Semantic Release Template

This is a basic template for a semantic release project.

## Features

- Semantic release
- Automatic changelog generation
- Automatic version bump
- NPM publishing

## Getting started

Click the "**Use this template**" button in Github to start your project.

When you use this template via Github, the [`workflows/create.yml`](.github/workflows/create.yml) workflow will do some setup work for you like renaming the repository and removing some files that are not needed in your project.

## Setup

### Secrets

Add the following [secrets to your repository](https://docs.github.com/en/actions/security-for-github-actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository):

- `GH_TOKEN`
- `NPM_TOKEN`

#### Github

You must create [a Personal Access Token (PAT)](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-fine-grained-personal-access-token) with the following permissions:

- `contents`: to be able to publish a GitHub release
- `issues`: to be able to comment on released issues
- `pull-requests`: to be able to comment on released pull requests
- `id-token`: to enable use of OIDC for npm provenance

#### NPM

You must create a [NPM token](https://docs.npmjs.com/about-access-tokens#about-granular-access-tokens) with "Read and Write" access to at minimum your package.

## Branches

The following branches are supported ([see configuration](https://semantic-release.gitbook.io/semantic-release/usage/configuration#branches)):

- `main`
- `next`
- `next-major`
- `beta`
- `alpha`
- `*.x`

You **need** to enable [branch protection](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches) for these branches in order to prevent unauthorized merges and releases.

## Release

Any merges to the target branches will trigger a release. See [semantic-releases' workflow](https://semantic-release.gitbook.io/semantic-release/recipes/release-workflow) for more details.
