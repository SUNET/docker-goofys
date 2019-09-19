FROM ubuntu:18.04
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN /bin/sed -i s/archive.ubuntu.com/se.archive.ubuntu.com/g /etc/apt/sources.list
RUN apt-get -y -q update && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:gophers/archive && apt-get -y -q update && apt-get install -y git fuse libfuse-dev golang-go
ENV PATH=$PATH:/root/.cargo/bin:/root/go/bin
RUN go get github.com/kahing/goofys
RUN go install github.com/kahing/goofys
#RUN cargo install catfs
ADD start.sh /
RUN chmod a+rx /start.sh
ENTRYPOINT /start.sh
