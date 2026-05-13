FROM caddy:2-builder@sha256:1ecefa333507828a592aaecc68d5f62a993787057429c04e9b0438a65c980a30 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:2@sha256:f6ec72f1a5c5927d4e269f27f4d8c7e4a9cb06641d2118eb33d91f68d9fbd14f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
