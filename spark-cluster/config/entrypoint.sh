#!/usr/bin/env bash

set -e

# Start services in the background
service ssh start

# Do nothing and just keep the container alive
sleep infinity
