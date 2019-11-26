FROM shri4u/myapp-base:0.1
RUN apt-get install -y --fix-missing \
    pkg-config libreadline-dev libxml2-dev wget

RUN pip install -r requirement.txt

WORKDIR /go/src/github.com/simple-app/
COPY . .
ENTRYPOINT ["/app.py"]
