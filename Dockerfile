FROM caddy:2-builder@sha256:d57008618f743e6308058d7bd990eb3489dfd04e2b82978cca7b953e1b491fc7 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:2@sha256:a22e108570bde2bf9ca3e584bc7d5bb94f9555e9e17353242e6ec4505ff4880d

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
