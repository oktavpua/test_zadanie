#!/bin/bash

HOST=${1:-localhost}
PORT=${2:-22}
LOGFILE="port_check.log"

# Проверка доступности порта с помощью nc (netcat)
nc -z -w 5 "$HOST" "$PORT"
if [ $? -ne 0 ]; then
    echo "$(date): Порт $PORT на хосте $HOST недоступен" >> "$LOGFILE"
fi
