FROM shri4u/myapp:1.1
RUN apk add --update --no-cache alpine-sdk bash ca-certificates docker\
      iproute2 fuse \
      git openssh yajl-dev zlib-dev cyrus-sasl-dev openssl-dev build-base coreutils nmap
RUN apk add openssl=1.0.2h-r1
RUN pip install -r requirement.txt
RUN pip install pytz requests elasticsearch elasticsearch-dsl django==1.2
#GITSECURE REMEDIATION 
RUN  pip install Django>=1.8.15  

#RUN apt-get install nmap
#RUN pip install watson-developer-cloud nltk tensorflow pytz
WORKDIR /go/src/github.com/mchmarny/simple-app/
COPY . .
ENTRYPOINT ["/app.py"]
