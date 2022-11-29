#!/bin/sh
set -o nounset
set -o errexit

if [ "${1:-}" = "--verbose" ]; then
    set -o xtrace
    shift
fi

TEMP_FILE=$(mktemp)

check_daemons() {
    if pgrep "VBoxHeadless" > /dev/null; then
        echo "VBoxHeadless"
    fi
    if pgrep "limactl" > /dev/null; then
        echo "limactl"
    fi
    if pgrep "mutagen" > /dev/null; then
        echo "mutagen"
    fi
    if pgrep -f "react-scripts" > /dev/null; then
        echo "react-scripts"
    fi
    if pgrep "java" > /dev/null; then
        echo "java"
    fi
    if pgrep "postgres" > /dev/null; then
        echo "postgres"
    fi
}

check_daemons > "${TEMP_FILE}"

if [ "${1:-}" = "" ]; then
    cat "${TEMP_FILE}"
else
    if [ -s "${TEMP_FILE}" ]; then
        cat "${TEMP_FILE}" > "${1}"
    else
        rm -f "${1}"
    fi
fi
