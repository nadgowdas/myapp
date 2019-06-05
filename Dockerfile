FROM golang:1.10.0-alpine3.7
RUN apk add --update --no-cache alpine-sdk bash ca-certificates docker\
      iproute2 dumb-init fuse \
      git openssh openssl yajl-dev zlib-dev cyrus-sasl-dev openssl-dev build-base coreutils

#RUN pip install -r requirement.txt
#RUN pip install pytz requests elasticsearch elasticsearch-dsl django==1.2
RUN pip install pytz django==1.2
WORKDIR /go/src/github.com/mchmarny/simple-app/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -v -o app
ENTRYPOINT ["/app"]
