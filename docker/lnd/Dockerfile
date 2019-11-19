FROM golang:1.13-alpine as builder

LABEL maintainer="Sparkswap <dev@sparkswap.com>"

# Force Go to use the cgo based DNS resolver. This is required to ensure DNS
# queries required to connect to linked containers succeed.
ENV GODEBUG netdns=cgo

# Install dependencies and install/build lnd.
RUN apk add --no-cache --update alpine-sdk \
    git \
    make

WORKDIR $GOPATH/src/github.com/lightningnetwork/lnd

# We are pegging lnd to this commit because this was the current version
# we were at in production on 08/30. Until a new release (0.7.2 or something)
# is released, we will stay at this change.
RUN git clone https://github.com/lightningnetwork/lnd . \
&&  git checkout cd3c2b508ec45373602e3cdb9cd19ab7b224f94d \
&&  git config --global user.email "dev@sparkswap.com" \
&&  git config --global user.name "dev" \
&&  git fetch https://github.com/halseth/lnd.git mainnet-neutrino:mainnet-neutrino \
&&  git cherry-pick mainnet-neutrino \
&&  make \
&&  make install tags="signrpc walletrpc chainrpc invoicesrpc routerrpc"

# Start a new, final image to reduce size.
FROM alpine as final

# Copy the binaries and entrypoint from the builder image.
COPY --from=builder /go/bin/lncli /bin/
COPY --from=builder /go/bin/lnd /bin/

# Add bash.
RUN apk add --no-cache \
    bash

# Expose lnd ports (server, rpc).
EXPOSE 9735 10009

# Make lnd folder default.
WORKDIR /home/lnd

COPY "start-lnd.sh" .
RUN chmod +x ./start-lnd.sh

COPY "./lnd.conf" "./lnd.conf"

# Create backup directory for static channel backup file
RUN mkdir -p /backup

CMD ["bash", "-c", "NODE=${NODE} ./start-lnd.sh"]
