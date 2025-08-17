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

# Create necessary directories
RUN mkdir -p /usr/local/bin /opt

# Copy scripts
COPY scripts/set-property /usr/local/bin/set-property
COPY scripts/bedrock-entry.sh /opt/bedrock-entry.sh

# Make scripts executable
RUN chmod +x /usr/local/bin/set-property /opt/bedrock-entry.sh

# Download Bedrock server
RUN cd /tmp && \
    wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.20.51.01.zip && \
    unzip bedrock-server-*.zip -d /data/ && \
    rm bedrock-server-*.zip

# Copy and set up start script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Set working directory
WORKDIR /data

# Expose the server port
EXPOSE 19132/udp

# Set the entrypoint
ENTRYPOINT ["/app/start.sh"]