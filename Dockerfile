FROM golang:1.22-alpine AS build
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build .

FROM alpine:edge

COPY --from=build /app/tcping /usr/bin/tcping
RUN apk --no-cache add ca-certificates tzdata

ENTRYPOINT ["tcping"]