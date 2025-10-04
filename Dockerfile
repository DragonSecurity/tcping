FROM golang:1.25-alpine@sha256:b6ed3fd0452c0e9bcdef5597f29cc1418f61672e9d3a2f55bf02e7222c014abd AS build
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY *.go .
COPY *ping .
RUN go build .

FROM alpine:edge@sha256:115729ec5cb049ba6359c3ab005ac742012d92bbaa5b8bc1a878f1e8f62c0cb8
RUN mkdir -p /usr/app/src
WORKDIR /usr/src/app
COPY --from=build /app/tcping .
COPY --from=build /app/*ping .

RUN chmod +x /usr/src/app/*ping

RUN apk --no-cache add ca-certificates tzdata
USER 1000
HEALTHCHECK --interval=5s --timeout=3s CMD ps aux | grep '[s]h ping' || exit 1
RUN ls /usr/src/app/
ENTRYPOINT ["sh", "/usr/src/app/healthping"]
