#!/bin/bash

cd /data

# Accept EULA
echo "eula=true" > eula.txt

# Configure server properties
set-property "server-name" "${SERVER_NAME:-Bedrock Dedicated Server}"
set-property "gamemode" "${GAMEMODE:-survival}"
set-property "difficulty" "${DIFFICULTY:-normal}"
set-property "allow-cheats" "${ALLOW_CHEATS:-false}"
set-property "max-players" "${MAX_PLAYERS:-10}"
set-property "online-mode" "${ONLINE_MODE:-true}"
set-property "server-port" "${SERVER_PORT:-19132}"

# Start the server
LD_LIBRARY_PATH=/data ./bedrock_server
