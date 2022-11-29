#!/bin/sh
set -o nounset
set -o errexit
if [ "${1:-}" = "trace" ]; then
    set -o xtrace
fi
if pgrep "VBoxHeadless" > /dev/null; then
    echo ◼︎
elif pgrep "limactl" > /dev/null; then
    echo ◼︎
elif pgrep "mutagen" > /dev/null; then
    echo ◼︎
elif pgrep -f "react-scripts" > /dev/null; then
    echo ◼︎
elif pgrep "java" > /dev/null; then
    echo ◼︎
elif pgrep "postgres" > /dev/null; then
    echo ◼︎
else
    echo ◻
fi
