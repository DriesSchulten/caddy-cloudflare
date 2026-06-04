FROM caddy:2-builder@sha256:47a19b0d310d09e226e9d7b9bcfb4bcc8fa7480d8903e2ebd40fa1512b9ce38c AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:2@sha256:cb9d71ad83182011b79355cd57692686374bd78d6fe327efe0ff8507da03ab13

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
