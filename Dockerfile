FROM itzg/minecraft-bedrock-server

ENV EULA="TRUE"

EXPOSE 19132/udp

VOLUME ["/data"]

CMD ["/start"]