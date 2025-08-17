FROM itzg/minecraft-bedrock-server:latest

# Default environment variables
ENV EULA=TRUE \
    SERVER_NAME="Railway-Bedrock" \
    GAMEMODE=survival \
    DIFFICULTY=normal \
    ONLINE_MODE=true

# Copy and set up start script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh