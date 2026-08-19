FROM caddy:2-builder@sha256:c085abfb0fc68e5cbde7dcbf2cbf5ca416a75a6a3343372586c1851e960885cc AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:2@sha256:df7f1c2fb114453b951de51a98efc010db1655a92c2e86be6706714e2417a78d

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
