# Caddy-easy-geofence

I created this project to make it easier to set up a reverse proxy with a geofence.

The reason is I wanted to deliever payloads to my users based on their location only and ignore security controls which might be lurking.

To get it up and running make sure you have Docker and Docker Compose installed.
Then run the following commands:
```
docker-compose up -d
```
This will build the Caddy image and start the container.
You can then access the container at http://<IP>:80 

By default it will redirect all traffic to the host machine on port 8080 if the user is not in the list of allowed countries.
To add a country to the list of allowed countries add it to the allow_countries list in the Caddyfile.

---

You may change the listening port by editing the docker-compose.yml file and serve caddy on a different port to reverse proxy to it via nginx or apache (I know it's an overkill but it's just an example).

You can also make minimal changes to the project and add Certbot to it to get SSL certificates whenever you run the container. 

I'll leave that as an exercise for the reader.