FROM alpine:latest

RUN apk update && apk add git curl make
RUN git clone https://github.com/tommyulfsparre/aurora_exporter exporter

# These libraries are required for compiling Go
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

# Compile the exporter and move it to /usr/bin
RUN cd exporter && make && mv /exporter/aurora_exporter /usr/bin/aurora_exporter

# Remove installation tools
RUN rm -rf /exporter && apk del git curl make

EXPOSE 9113

ENTRYPOINT ["/usr/bin/aurora_exporter"]
