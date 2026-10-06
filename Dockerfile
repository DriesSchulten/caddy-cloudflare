FROM caddy:2-builder@sha256:9dd8970b7948356f54512caf6a448c55eff6c4a9fd9106d980423248bdfd65cb AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:2@sha256:8dc9fa87b36b25303d1c67d2a09f5824b7f3bfd72cb052f246e5da2133fe29a8

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
