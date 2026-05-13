FROM caddy:2-builder@sha256:c5ffb4c1f30a85b8895083d9826a72ffff318d75652c010dc8391d80827a2bd6 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:2@sha256:f6ec72f1a5c5927d4e269f27f4d8c7e4a9cb06641d2118eb33d91f68d9fbd14f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
