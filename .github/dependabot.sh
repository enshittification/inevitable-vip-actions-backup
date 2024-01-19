#!/bin/sh

DIR="$(dirname "$0")"

(
    echo "version: 2"
    echo
    echo "updates:"
    echo "  - directory: '/'"
    echo "    package-ecosystem: 'github-actions'"
    echo "    schedule:"
    echo "      interval: 'daily'"
    echo "    labels:"
    echo "      - '[Status] Needs Review'"
    echo
    echo "  - directory: '/'"
    echo "    package-ecosystem: 'npm'"
    echo "    schedule:"
    echo "      interval: 'daily'"
    echo "    labels:"
    echo "      - '[Status] Needs Review'"
    echo
    echo "  - directory: '/junit-newrelic-processor'"
    echo "    package-ecosystem: 'docker'"
    echo "    schedule:"
    echo "      interval: 'daily'"
    echo "    labels:"
    echo "      - '[Status] Needs Review'"
    echo

    # shellcheck disable=SC2044
    for i in $(find "${DIR}/../" -type f -name "action.yml" -exec dirname {} \;); do
        echo "  - directory: '${i}'"
        echo "    package-ecosystem: 'github-actions'"
        echo "    schedule:"
        echo "      interval: 'daily'"
        echo "    labels:"
        echo "      - '[Status] Needs Review'"
        echo
    done
) > "${DIR}/dependabot.yml"
