#! /bin/bash

set -Eeuxo pipefail

: "${workspace_location:=.}"
: "${component_to_analyze:=platform::ZCU102.Impl}"
: "${project_path:=}"
: "${output_path:=./Resolint_output.json}"
: "${validation_only:=}"
: "${return_passing_results:=}"
: "${exit_on_warning:=}"
: "${supplementary_aadl:=}"
: "${rulesets:=}"
: "${GITHUB_WORKSPACE:=/home/runner/work}"

docker run --rm -v $1:${GITHUB_WORKSPACE} \
    -v ./:/home/runner \
    -e GITHUB_WORKSPACE=${GITHUB_WORKSPACE} \
    -e GITHUB_OUTPUT='/dev/stdout' \
    --entrypoint /home/runner/entrypoint.sh \
    ghcr.io/loonwerks/inspecta-tools:4.20250825.20d1bda \
    "${workspace_location}" "${component_to_analyze}" "${project_path}" "${output_path}" \
    "${validation_only}" "${return_passing_results}" "${exit_on_warning}" \
    "${supplementary_aadl}" "${rulesets}"

