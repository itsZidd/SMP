FROM itzg/minecraft-bedrock-server:latest

# Default environment variables
ENV EULA=TRUE \
    SERVER_NAME="Railway-Bedrock" \
    GAMEMODE=survival \
    DIFFICULTY=normal \
    ONLINE_MODE=true
