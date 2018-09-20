FROM golang:1-alpine

RUN apk update && \
    apk add --virtual build-deps musl-dev zlib-dev ghc cabal wget

# Ignore "createSymbolicLink: does not exist"
RUN cabal update && \
    cabal install --prefix /usr/local pandoc || \
    echo Ignoring error

RUN rm -r /root/.cabal && \
    apk del --purge build-deps

# Additional runtime dependencies. Weirdly, these are not needed to build
# pandoc, but running pandoc without them will complain about missing library.
RUN apk add gmp libffi
