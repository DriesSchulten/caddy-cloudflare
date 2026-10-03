FROM caddy:2-builder@sha256:34466183d881df9a8226caf360ff86fe50456f0971221b127dcb756cf514e1ea AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:2@sha256:13b7fbadd017b042956fddbceedeeea12bb1e560534f9b3df281269dbcc61813

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
