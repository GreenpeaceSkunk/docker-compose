#!/usr/bin/env bash

git submodule update --init --recursive

# Clone or Update API
api="$(git config --file .gitmodules --get-regexp path | awk '{ print $2 }' | grep src/api)"
if [ -z "$api" ]
then
  git submodule add -f --name api https://github.com/GreenpeaceSkunk/greenlab-api.git src/api
fi

# Clone or Update Coupon
coupon="$(git config --file .gitmodules --get-regexp path | awk '{ print $2 }' | grep src/coupon)"
if [ -z "$coupon" ]
then
  git submodule add -f --name coupon https://github.com/GreenpeaceSkunk/cupon-mercadopago.git src/coupon
fi

# Clone or Update Landing Downgrade
landing-downgrade="$(git config --file .gitmodules --get-regexp path | awk '{ print $2 }' | grep src/landing-downgrade)"
if [ -z "$landing-downgrade" ]
then
  git submodule add -f --name landing-downgrade https://github.com/GreenpeaceSkunk/landing-downgrade src/landing-downgrade
fi
