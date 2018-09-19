FROM golang:1-alpine

RUN apk update && \
    apk add --virtual build-deps musl-dev zlib-dev ghc cabal wget

# Ignore "createSymbolicLink: does not exist"
RUN cabal update && \
    cabal install --prefix /usr/local pandoc || \
    echo Ignoring error

# RUN apk add gmp libffi

RUN rm -r /root/.cabal && \
    apk del --purge build-deps
