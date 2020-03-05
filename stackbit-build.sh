#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e60a06e245c5e001938a87d/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e60a06e245c5e001938a87d
curl -s -X POST https://api.stackbit.com/project/5e60a06e245c5e001938a87d/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e60a06e245c5e001938a87d/webhook/build/publish > /dev/null
