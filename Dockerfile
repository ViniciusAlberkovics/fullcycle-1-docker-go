FROM golang:alpine AS builder

COPY . /usr/app

WORKDIR /usr/app

RUN go build rocks.go

FROM hello-world
WORKDIR /usr/app
COPY --from=builder /usr/app .
ENTRYPOINT [ "./rocks" ]
