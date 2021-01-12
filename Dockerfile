## Buildstage ##
FROM ghcr.io/linuxserver/baseimage-alpine:3.12 as buildstage

# Build arguments
ARG VERSION

# Add version number for use in container init script
RUN mkdir -p /root-layer/etc && \
  echo "$VERSION" > /root-layer/etc/version.sma

# Download SMA
RUN mkdir -p /root-layer/usr/local/share/scripts && \
  mkdir -p /root-layer/config && \
  wget -O - https://github.com/mdhiggins/sickbeard_mp4_automator/tarball/$VERSION | \
  tar -xzC /root-layer/usr/local/share/scripts && \
  mv /root-layer/usr/local/share/scripts/mdhiggins-sickbeard_mp4_automator-$VERSION /root-layer/usr/local/share/scripts/sma && \
  ln -nsf /config/autoProcess.ini /root-layer/usr/local/share/scripts/sma/config/autoProcess.ini

# Stage local files
COPY root/ /root-layer/

## Single layer deployed image ##
FROM scratch

LABEL maintainer="Morton Jonuschat"

# Copy files from buildstage
COPY --from=buildstage /root-layer/ /
