FROM golang:1.9.2-alpine3.6 AS build
# Set working directory
WORKDIR /go/src/github.com/tinrab/docker-multi-stage-build-kubernetes
# Copy packages
COPY hello-world hello-world
COPY current-time current-time
# Build
RUN go build -v -o /go/bin/hello-world ./hello-world
RUN go build -v -o /go/bin/current-time ./current-time

# Build final image
FROM alpine:3.6
WORKDIR /usr/bin
COPY --from=build /go/bin .
