#!/bin/bash
# This script builds for release and puts api secrets in relevant files

# Insert secrets
openssl aes-256-cbc -K $encrypted_cb700307e8da_key -iv $encrypted_cb700307e8da_iv -in scripts/credentials.ts.enc -out src/models/credentials.ts -d

# Build release
scripts/build.sh chrome
scripts/build.sh firefox
scripts/build.sh edge
mkdir release
mv chrome firefox edge release
tar -cvzf release.tar.gz release/*
