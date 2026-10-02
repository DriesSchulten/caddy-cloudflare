FROM caddy:2-builder@sha256:369218c81ca6d6af249981221b3a5c764d886dd5b058f51d144066de13f2418d AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:2@sha256:13b7fbadd017b042956fddbceedeeea12bb1e560534f9b3df281269dbcc61813

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
