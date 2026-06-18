#!/bin/bash
# Launch MAVProxy with outputs for 3 QGC instances
# Ports: 14550 (master from SITL), 14551-14553 (one per QGC)

mavproxy.py \
    --master=udp:127.0.0.1:14550 \
    --out=udp:127.0.0.1:14551 \
    --out=udp:127.0.0.1:14552 \
    --out=udp:127.0.0.1:14553 \
    --out=udp:127.0.0.1:14554
