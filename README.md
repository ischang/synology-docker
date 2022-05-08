# synology-docker

backup templates for my docker compose files for machine agnostic configs
mostly notes for myself in case i come back to this 900 years later after setting everything up and a one and done and i forget everything (because i will haha)

for all docker-compose files: 
- replace pid&gid with user that has docker folder privileges doh
- replace local_port & container_port with proper ports 

for updates (if not using portainer-ce): 
`docker-compose down && docker-compose pull && docker-compose up -d` 

other notes:
- PMS needs to run in network_mode or local networks can't discover it
- for tailscale purposes: https://forums.plex.tv/t/ability-to-manually-set-public-ip-for-remote-access/189111/24?utm_source=pocket_mylist
