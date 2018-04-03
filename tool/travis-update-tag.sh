#!/bin/sh

set -e

cd "${TRAVIS_BUILD_DIR}"

git config --global push.default simple
git config user.name "Travis CI"
git config user.email "travis@travis-ci.org"

git checkout "${TRAVIS_BRANCH}"
git push "https://${GH_REPO_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git" :refs/tags/latest-release
git tag -d latest-release || true
git tag latest-release
git push "https://${GH_REPO_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git" --tags