FROM golang:1.10.0-alpine3.7
RUN apk add --update --no-cache alpine-sdk bash ca-certificates docker\
      libressl \
      iproute2 dumb-init fuse \
      git openssh openssl yajl-dev zlib-dev cyrus-sasl-dev openssl-dev build-base coreutils
   
#RUN pip install -r requirement.txt

RUN pip install pytz requests elasticsearch elasticsearch-dsl
WORKDIR /go/src/github.com/mchmarny/simple-app/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -v -o app
ENTRYPOINT ["/app"]
