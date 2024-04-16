#!/bin/bash

REPO_URL="https://github.com/randy-organization/terraform-user.git"
BRANCH="main"
git clone --branch $BRANCH $REPO_URL
cd terraform-user
git pull origin $BRANCH
