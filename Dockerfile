FROM golang1.22.4-alpine as build
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o tcping .

FROM alpine:edge

COPY --from=build /app/tcping /usr/bin/tcping
RUN apk --no-cache add ca-certificates tzdata

ENTRYPOINT ["tcping"]