FROM ubuntu:22.04

# Install required dependencies
RUN apt-get update && \
    apt-get install -y \
    wget \
    unzip \
    curl \
    libcurl4 \
    libssl3 \
    jq \
    python3 \
    python3-pip \
    dos2unix \
    && pip3 install yq \
    && rm -rf /var/lib/apt/lists/*

# Set up environment variables
ENV EULA=TRUE \
    SERVER_NAME="Railway-Bedrock" \
    GAMEMODE=survival \
    DIFFICULTY=normal \
    ONLINE_MODE=true \
    VERSION=LATEST \
    SERVER_PORT=19132

# Create necessary directories
RUN mkdir -p /data /app /opt

# Download and set up the server
RUN curl -sL https://raw.githubusercontent.com/itzg/docker-minecraft-bedrock-server/master/start-configuration \
    -o /opt/start-configuration && \
    curl -sL https://raw.githubusercontent.com/itzg/docker-minecraft-bedrock-server/master/auto-versions \
    -o /opt/auto-versions && \
    curl -sL https://raw.githubusercontent.com/itzg/docker-minecraft-bedrock-server/master/bedrock-entry.sh \
    -o /opt/bedrock-entry.sh && \
    curl -sL https://raw.githubusercontent.com/itzg/docker-minecraft-bedrock-server/master/bin/set-property \
    -o /usr/local/bin/set-property && \
    curl -sL https://raw.githubusercontent.com/itzg/docker-minecraft-bedrock-server/master/bin/mc-monitor \
    -o /usr/local/bin/mc-monitor && \
    chmod +x /opt/bedrock-entry.sh /opt/start-configuration /opt/auto-versions /usr/local/bin/set-property /usr/local/bin/mc-monitor && \
    mkdir -p /usr/local/bin

# Copy and set up start script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Set working directory
WORKDIR /data

# Expose the server port
EXPOSE 19132/udp

# Set the entrypoint
ENTRYPOINT ["/app/start.sh"]