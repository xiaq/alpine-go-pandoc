FROM golang:1-alpine

RUN apk update && \
    apk add --virtual build-deps musl-dev zlib-dev ghc cabal
RUN cabal update && \
    cabal install pandoc
RUN apk del --purge build-deps
