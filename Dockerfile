FROM caddy:2-builder@sha256:aef223d1f943bc12a29a9e0a0a73983aa19a36672daede7507da4201a6b1016a AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:2@sha256:4851e54a46b206517c574821bb5cc67f170d2156041e9fbc4c9193b45e84a75b

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
