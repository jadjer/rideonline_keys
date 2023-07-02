#!/bin/bash

KEYS_DIR=$1
PRIVATE_KEY_NAME=$2
PUBLIC_KEY_NAME=$3

if [ ! -d "$KEYS_DIR" ]
then
  mkdir -p "$KEYS_DIR"
fi

PRIVATE_KEY="$KEYS_DIR/$PRIVATE_KEY_NAME"
PUBLIC_KEY="$KEYS_DIR/$PUBLIC_KEY_NAME"

if [ ! -f "$PRIVATE_KEY" ] || [ ! -f "$PUBLIC_KEY" ]
then
  openssl genpkey -algorithm RSA -out "$PRIVATE_KEY"
  openssl rsa -pubout -in "$PRIVATE_KEY" -out "$PUBLIC_KEY"
fi

ls -la "$KEYS_DIR"
