FROM caddy:2-builder@sha256:f5b1a66449d305280e559dba0ab9f7ce9a2a14c527c79d7c6fb48abc8f895818 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:2@sha256:3422ce6de165df66534f9b9ba50efaf457114ec961763cc52f5dbdaac2972d73

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
