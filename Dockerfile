FROM ubuntu:16.04
RUN apt-get -y -q update && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:gophers/archive && apt-get -y -q update && apt-get install -y rustc cargo golang-1.9-go
RUN apt-get install -y git
ENV PATH=$PATH:/usr/lib/go-1.9/bin
RUN go get github.com/kahing/goofys
RUN go install github.com/kahing/goofys
RUN apt-get install -y fuse libfuse-dev
RUN cargo install catfs
ENV PATH=$PATH:/root/.cargo/bin:/root/go/bin
ADD start.sh /
RUN chmod a+rx /start.sh
ENTRYPOINT /start.sh
