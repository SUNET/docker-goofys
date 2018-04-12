FROM ubuntu:16.04
RUN apt-get -y -q update && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:gophers/archive && apt-get -y -q update && apt-get install -y git fuse libfuse-dev golang-1.9-go
ENV PATH=$PATH:/usr/lib/go-1.9/bin:/root/.cargo/bin:/root/go/bin
RUN go get github.com/kahing/goofys
RUN go install github.com/kahing/goofys
#RUN cargo install catfs
ADD start.sh /
RUN chmod a+rx /start.sh
ENTRYPOINT /start.sh
