#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5eb1a22491c5b50019bd4207/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5eb1a22491c5b50019bd4207
curl -s -X POST https://api.stackbit.com/project/5eb1a22491c5b50019bd4207/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5eb1a22491c5b50019bd4207/webhook/build/publish > /dev/null
