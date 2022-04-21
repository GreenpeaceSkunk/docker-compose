#!/usr/bin/env bash

LOGS=/var/log/greenlab.log
# LOGS=./greenlab.log
if test -f "$LOGS_FILE"; then
    echo "$LOGS_FILE exists."
else
  touch $LOGS_FILE
fi

if [ ! "$(docker ps -q -f name=greenlab_api)" ] | [ ! "$(docker ps -q -f name=greenlab_coupon)" ]; then
  echo "$(date): Service is down" >> $LOGS
  echo "$(date): $(docker ps -a)" >> $LOGS
  make build-prod-silent
else
 echo  "$(date): Service is up" >> $LOGS
fi
