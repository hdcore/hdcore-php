#!/bin/bash

# Author Danny
# Version GIT: 2021-09-13 21:10

# run-composer-install.sh 
#
# Wrapper for composer install with configuration in the environment variables
#
# First set the composer configuration
# - COMPOSER_GITHUB_TOKEN
# - COMPOSER_GITLAB_TOKEN
# Then do a composer install when the composer.json file present
# 
# Compatible with: github, gitlab, composer


echo -e "Starting ${0}"
echo -e "\e[32mConfiguring composer configuration...\e[0m"

# Github token
if [ -n "${COMPOSER_GITHUB_TOKEN}" ]
then
    echo "Adding github token to composer"
    composer config github-oauth.github.com ${COMPOSER_GITHUB_TOKEN}
fi

# Gitlab token
if [ -n "${COMPOSER_GITLAB_TOKEN}" ]
then
    echo "Adding gitlab token to composer"
    composer config gitlab-token.gitlab.com ${COMPOSER_GITLAB_TOKEN}
fi

# Installing requirements
echo "Installing composer.json requirements"
composer install "$@"

echo -e "\e[32mDone\e[0m"