FROM ubuntu:18.04

RUN apt -qq update && \
    DEBIAN_FRONTEND=noninteractive apt install -y git golang awscli

RUN go get github.com/go-telegram-bot-api/telegram-bot-api && \
    go get github.com/aws/aws-sdk-go

WORKDIR /src

CMD ["/usr/bin/go", "run", "bot.go"]
