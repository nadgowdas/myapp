FROM shri4u/myapp-base:0.1
RUN apk add --update --no-cache alpine-sdk bash ca-certificates openssh 

RUN pip install -r requirement.txt

WORKDIR /go/src/github.com/simple-app/
COPY . .
ENTRYPOINT ["/app.py"]
