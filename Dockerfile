FROM golang:1.22-alpine AS build
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY *.go .
COPY *ping .
RUN go build .

FROM alpine:edge
RUN mkdir -p /usr/app/src
WORKDIR /usr/src/app
COPY --from=build /app/tcping .
COPY --from=build /app/*ping .

RUN chmod +x /usr/src/app/*ping

RUN apk --no-cache add ca-certificates tzdata
HEALTHCHECK --interval=5s --timeout=3s CMD ps aux | grep '[s]h ping' || exit 1
RUN ls /usr/src/app/
USER 1000
ENTRYPOINT ["sh", "/usr/src/app/healthping"]