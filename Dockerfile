FROM shri4u/myapp-base:0.1
RUN apt-get update --fix-missing && apt-get install -y --fix-missing \
    pkg-config libreadline-dev libxml2-dev

WORKDIR /app
COPY requirements.txt /app
RUN pip install --no-cache-dir -r requirements.txt
#GITSECURE REMEDIATION 
RUN  apt-get update && apt-get install -y --fix-missing apt=1.0.9.8.5  systemd=215-17+deb8u12 \ 
     sensible-utils=0.0.9+deb8u1  procps=2:3.3.9-9+deb8u1 \ 
     libgcrypt20=1.6.3-2+deb8u6  bash=4.3-11+deb8u2 \ 
     gnupg=1.6.3-2+deb8u4  e2fsprogs=1.42.12-2+deb8u1 \ 
      


WORKDIR /go/src/github.com/simple-app/
COPY . .
ENTRYPOINT ["/app.py"]
