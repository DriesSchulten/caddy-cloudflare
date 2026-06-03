FROM caddy:2-builder@sha256:aa338f10bbce3e395b6f57061b1c3c53d1e54b83e10ce2395420d1e60f3f6819 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:2@sha256:ec18ee54aab3315c22e25f3b2babda73ff8007d39b13b3bd1bfffa2f0444c7d9

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
