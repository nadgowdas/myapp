FROM golang:1.10.0-alpine3.7
RUN apk add --update --no-cache alpine-sdk bash ca-certificates docker\
      iproute2 dumb-init fuse \
      git openssh yajl-dev zlib-dev cyrus-sasl-dev openssl-dev build-base coreutils nmap
RUN apk add openssl=1.0.2h-r1
#RUN pip install -r requirement.txt
#RUN pip install pytz requests elasticsearch elasticsearch-dsl django==1.2
#RUN apt-get install nmap
RUN pip install watson-developer-cloud nltk tensorflow pytz
WORKDIR /go/src/github.com/mchmarny/simple-app/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -v -o app
ENTRYPOINT ["/app"]
