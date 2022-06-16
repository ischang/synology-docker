version: "2.1"
services:
  sonarr:
    image: lscr.io/linuxserver/sonarr:latest
    container_name: sonarr
    environment:
      - TZ=America/New_York
      - GUID=[[GUID]]
      - PUID=[[PUID]]  
    volumes:
      - /volume1/docker/sonarr/config:/config
      - /volume1/media/Dramas:/dramas
      - /volume1/media/Anime:/anime
      - /volume1/media/Shows:/shows
      - /volume1/downloads/seedbox_downloads:/seedbox_downloads
      - /volume1/downloads/usenet_downloads:/usenet_downloads
    ports:
      - [[LOCALPORT]]:[[CONTAINERPORT]]
    restart: unless-stopped

  radarr:
    image: lscr.io/linuxserver/radarr:latest
    container_name: radarr
    environment:
      - TZ=America/New_York
      - GUID=[[GUID]]
      - PUID=[[PUID]]  
    volumes:
      - /volume1/docker/radarr/config:/config
      - /volume1/media/Movies:/movies
      - /volume1/media/Animation:/animation
      - /volume1/downloads/seedbox_downloads:/seedbox_downloads
      - /volume1/downloads/usenet_downloads:/usenet_downloads
    ports:
      - [[LOCALPORT]]:[[CONTAINERPORT]]
    restart: unless-stopped

  jackett:
    image: lscr.io/linuxserver/jackett:latest
    container_name: jackett
    environment:
      - TZ=America/New_York
      - GUID=[[GUID]]
      - PUID=[[PUID]]  
    volumes:
      - /volume1/docker/jackett/config:/config
      - /volume1/docker/jackett/downloads:/downloads
    ports:
      - [[LOCALPORT]]:[[CONTAINERPORT]]
    restart: unless-stopped
