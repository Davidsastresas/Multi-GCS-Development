#!/bin/bash
# Launch ArduPilot SITL (copter) with output to MAVProxy's master port
# Run this BEFORE launch-mavproxy.sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
AP_DIR="$SCRIPT_DIR/ardupilot"

if [ ! -d "$AP_DIR/Tools/autotest" ]; then
    echo "ArduPilot tree not found at: $AP_DIR"
    exit 1
fi

cd "$AP_DIR"
Tools/autotest/sim_vehicle.py -v ArduCopter --out=udp:127.0.0.1:14550 "$@"
