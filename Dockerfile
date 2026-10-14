FROM caddy:2-builder@sha256:5b98e8a4c3d077585c5980b205cfcc9602d820675d5e0cfdbf5eeff939dc0b4a AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:2@sha256:685ae3d7c34d9b5f8caeddc5d14051db7bbd88ff1f5a2fa0c16bd8ca328fb7af

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
