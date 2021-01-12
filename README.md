# SMA Docker Mod

A [Docker Mod](https://github.com/linuxserver/docker-mods) for the LinuxServer.io Radarr/Sonarr Docker container that adds a script to automatically convert media files downloaded by various programs to a standardized format, and tags them with the appropriate metadata from TMDB if the container supports tagging.

**One unified script works in both Radarr and Sonarr.  Use this mod in either container!**
>**NOTE:** This mod support Linux OSes only.

# Installation

1. Pull your selected container ([linuxserver/radarr](https://hub.docker.com/r/linuxserver/radarr "LinuxServer.io's Radarr container") or [linuxserver/sonarr](https://hub.docker.com/r/linuxserver/sonarr "LinuxServer.io's Sonarr container")) from Docker Hub:  
   `docker pull linuxserver/radarr:latest`   OR  
   `docker pull linuxserver/sonarr:latest`

2. Configure the Docker container with all the port, volume, and environment settings from the *original container documentation* here:  
   **[linuxserver/radarr](https://hub.docker.com/r/linuxserver/radarr "Radarr Docker container")**  
   **[linuxserver/sonarr](https://hub.docker.com/r/linuxserver/sonarr "Sonarr Docker container")**
    1. Add the **DOCKER_MODS** environment variable to the `docker create` command, as follows:  
       `-e DOCKER_MODS=mjonuschat/docker-mod-sma:latest`

    2. Provide a config for SMA:  
      `-v /path/to/autoProcess.ini:/config/autoProcess.ini`

    3. Start the container.

3. Configure Sonarr/Radarr according to SMA [documentation](https://github.com/mdhiggins/sickbeard_mp4_automator):