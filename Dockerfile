FROM itzg/minecraft-bedrock-server:latest

ENV EULA=TRUE
ENV SERVER_NAME="TOmodachi Server"
ENV DIFFICULTY=normal
ENV WHITE_LIST=false
ENV GAMEMODE=survival
ENV MAX_PLAYERS=10

ENV DEBUG=false
ENV CONTENT_LOG_FILE_ENABLED=false
ENV CONTENT_LOG_CONSOLE_OUTPUT_ENABLED=false

# Expose the Bedrock port
EXPOSE 19132/udp

STOPSIGNAL SIGTERM

CMD ["sh", "-c", "sleep 5 && exec /start"]