# use tag:java8-multiarch with minecraft < 1.18
FROM itzg/minecraft-server:latest

WORKDIR /app

ENV EULA=TRUE
ENV ONLINE_MODE=TRUE
ENV ALLOW_FLIGHT=TRUE
ENV ENABLE_COMMAND_BLOCK=TRUE

ENV TYPE="VANILLA"
ENV VERSION="1.20.6"
# ENV FORGE_VERSION="36.2.42"

ENV OVERRIDE_OPS=TRUE
# Mohaidoss, Nek0Tsundere
ENV OPS="51accea6-3ab2-43d8-a9fe-ea9e3b31495f,e4d72e49-f8a8-4a1b-8f1e-75cfe691c8e6"

ENV SERVER_NAME="My Server"
ENV MOTD="This is a server description"
ENV RCON_PASSWORD="<SET_A_SECRET>"

# https://github.com/itzg/docker-minecraft-server#downloadable-modplugin-pack-for-forge-fabric-and-bukkit-like-servers
# escape=`
ENV CF_API_KEY="<CURSE_FORGE_SECRET>"

# ENV CURSEFORGE_FILES="mc-mod-link" # For single mod or multiple selected mods

# ENV CF_SLUG="lucky-block-challenge" # For modpacks
# ENV CF_FILENAME_MATCHER="1.0.5" # For modpacks
# ENV MOD_PLATFORM="AUTO_CURSEFORGE" # For modpacks

EXPOSE 25565

ENTRYPOINT [ "/start" ]
HEALTHCHECK --start-period=1m --interval=5s --retries=24 CMD mc-health

