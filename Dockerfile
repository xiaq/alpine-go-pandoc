FROM pandoc/core:latest as pandoc
FROM golang:1-alpine
COPY --from=pandoc /usr/local /usr/local

# Runtime dependencies.
RUN apk update && apk add gmp libffi lua5.3 lua5.3-lpeg
