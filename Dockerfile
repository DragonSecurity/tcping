FROM golang:1.22-alpine@sha256:1699c10032ca2582ec89a24a1312d986a3f094aed3d5c1147b19880afe40e052 AS build
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
