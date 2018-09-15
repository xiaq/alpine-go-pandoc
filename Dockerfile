FROM golang:1-alpine

RUN apk update && \
    apk add --virtual build-deps musl-dev zlib-dev ghc cabal wget && \
    cabal update && \
    cabal install --global pandoc && \
    apk add gmp libffi

# RUN rm -r /root/.cabal/lib /root/.cabal/packages && \
#     apk del --purge build-deps
# RUN ln -s /root/.cabal/bin/pandoc /usr/local/bin/
