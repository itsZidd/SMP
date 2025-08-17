#!/bin/bash

# Ensure scripts are in Unix format
dos2unix /opt/bedrock-entry.sh /opt/start-configuration /opt/auto-versions /usr/local/bin/set-property

# Set up environment
export PATH="/usr/local/bin:${PATH}"
export VERSION=LATEST

# Run the bedrock server entrypoint script
exec /opt/bedrock-entry.sh
