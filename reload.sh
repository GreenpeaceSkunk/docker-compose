#!/usr/bin/env bash

LOGS=/var/log/greenlab.log
DOCKER_API="greenlab-api"
DOCKER_COUPON="greenlab-coupon"
# DOCKER_LANDING_DOWNGRADE="greenlab-landing-downgrade"

service_running=true

if test -f "$LOGS_FILE"; then
    echo "$LOGS_FILE exists."
else
  touch $LOGS_FILE
fi

echo "Checking $DOCKER_API status: ($(docker ps -q -f name=$DOCKER_API))"
if [ ! "$(docker ps -q -f name=$DOCKER_API)" ]; then
 service_running=false
 echo "$(date): Service $DOCKER_API is down" >> $LOGS
else
  echo "$(date): Service $DOCKER_API is up" >> $LOGS
fi

echo "Checking $DOCKER_COUPON status: ($(docker ps -q -f name=$DOCKER_COUPON))"
if [ ! "$(docker ps -q -f name=$DOCKER_COUPON)" ]; then
  service_running=false
  echo "$(date): Service $DOCKER_COUPON is down" >> $LOGS
else
  echo "$(date): Service $DOCKER_COUPON is up" >> $LOGS
fi

echo "Checking $DOCKER_LANDING_DOWNGRADE status: ($(docker ps -q -f name=$DOCKER_LANDING_DOWNGRADE))"
if [ ! "$(docker ps -q -f name=$DOCKER_LANDING_DOWNGRADE)" ]; then
  service_running=false
  echo "$(date): Service $DOCKER_LANDING_DOWNGRADE is down" >> $LOGS
else
  echo "$(date): Service $DOCKER_LANDING_DOWNGRADE is up" >> $LOGS
fi

if [ "$service_running" = false ]; then
  echo "$(date): Reloading" >> $LOGS
  make -f build-prod-silent
  echo "$(date): Reloaded" >> $LOGS
else
  echo "$(date): All good" >> $LOGS
fi

