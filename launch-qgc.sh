#!/bin/bash
# Launch 3 QGC instances with system IDs 253, 254, 255
# Each runs in the background; Ctrl+C kills all of them

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
QGC="$SCRIPT_DIR/qgroundcontrol/build/Debug/QGroundControl"

if [ ! -x "$QGC" ]; then
    echo "QGC binary not found at: $QGC"
    echo "Build it first, then re-run this script."
    exit 1
fi

SYSIDS=(249 253 254 255)
PIDS=()

cleanup() {
    echo ""
    echo "Stopping all QGC instances..."
    for pid in "${PIDS[@]}"; do
        kill "$pid" 2>/dev/null
    done
    wait 2>/dev/null
    echo "Done."
}
trap cleanup EXIT INT TERM

for id in "${SYSIDS[@]}"; do
    echo "Launching QGC with system-id $id ..."
    "$QGC" --system-id "$id" --allow-multiple &
    PIDS+=($!)
done

echo ""
echo "Running ${#SYSIDS[@]} QGC instances (PIDs: ${PIDS[*]})"
echo "Press Ctrl+C to stop all."
wait
