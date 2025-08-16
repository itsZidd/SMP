FROM itzg/minecraft-bedrock-server:latest

# Set environment variables
ENV EULA=TRUE
ENV SERVER_NAME="TOmodachi Server"
ENV GAMEMODE=survival
ENV DIFFICULTY=normal
ENV MAX_PLAYERS=10
ENV ALLOW_CHEATS=false
ENV ONLINE_MODE=true
ENV WHITE_LIST=false
ENV DEBUG=true
ENV INIT_MEMORY=512M
ENV MAX_MEMORY=1G

# Expose the Bedrock port
EXPOSE 19132/udp

# Use the default entrypoint from the base image