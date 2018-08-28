FROM golang:1.10.2
LABEL maintainer="Cristian C. Wolfram <cristiancw@gmail.com>"

ENV GOBIN $GOPATH/bin

WORKDIR ./

RUN go get -d -v github.com/prometheus/prometheus/documentation/examples/remote_storage/remote_storage_adapter
RUN go install -v github.com/prometheus/prometheus/documentation/examples/remote_storage/remote_storage_adapter

EXPOSE 9201

ENTRYPOINT [ "remote_storage_adapter" , "-graphite-address=localhost:8080", "-graphite-prefix=server" ]
