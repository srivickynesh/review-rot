#!/bin/bash
set -euo pipefail

authors='[
  "srivickynesh",
  "avi-biton"
]'

# Assumes data from stdin!
jq --argjson authors "${authors}" -r '[
    .[] | select(
        ([.user] | inside($authors)) or
        (.url | contains("/enterprise-contract/")) or
        (.title | test("enterprise.contract"; "i"))
    )
]'
