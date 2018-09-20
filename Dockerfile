FROM alpine as builder

# Build-time dependencies.
RUN apk update && \
    apk add musl-dev zlib-dev ghc cabal wget

# Ignore "createSymbolicLink: does not exist"
RUN cabal update && \
    cabal install --prefix /usr/local pandoc || \
    echo Ignoring error

FROM golang:1-alpine

COPY --from=builder /usr/local /usr/local
# Runtime dependencies.
RUN apk update && apk add gmp libffi
