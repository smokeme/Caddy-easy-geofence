# Build the custom Caddy image with the MaxMind Geolocation plugin
FROM caddy:2.7.2-builder AS builder
RUN xcaddy build v2.7.2 \
    --with github.com/porech/caddy-maxmind-geolocation

# Use the built Caddy image as the base
FROM caddy:2.7.2
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

# Copy the MaxMind GeoLite2 database
COPY shared/GeoLite2-Country.mmdb /usr/share/GeoIP/GeoLite2-Country.mmdb

# Set up a directory for the Caddyfile and any other configuration
WORKDIR /etc/caddy

# Copy the Caddyfile
COPY Caddyfile /etc/caddy/Caddyfile

# Create directories for logs
RUN mkdir -p /var/log/caddy

# Expose the port for HTTP only
EXPOSE 80
