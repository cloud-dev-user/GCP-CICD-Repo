#!/bin/bash
set -e
echo "Running custom compliance checks..."

APPROVED_LICENSES=("MIT" "Apache-2.0")
LICENSE=$(jq -r '.license' package.json)

if [[ ! " ${APPROVED_LICENSES[*]} " =~ " ${LICENSE} " ]]; then
  echo "License $LICENSE is not approved. Failing build."
  exit 1
else
  echo "License $LICENSE is approved."
fi
