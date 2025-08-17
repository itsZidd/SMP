#!/bin/bash

# Set up environment
export PATH="/usr/local/bin:${PATH}"

# Run the bedrock server entrypoint script
exec /opt/bedrock-entry.sh
