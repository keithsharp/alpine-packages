FROM alpine:3.6
MAINTAINER Keith Sharp <keith.sharp@passback.co.uk>

RUN apk add --update alpine-sdk \
    && adduser -G abuild -g "Alpine Package Builder" -s /bin/ash -D builder \
    && echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && mkdir /packages \
    && chown builder:abuild /packages

WORKDIR /home/builder
COPY grpc ./grpc
RUN chown -R builder:abuild /home/builder/grpc

USER builder
ENTRYPOINT ["/bin/ash"]

ENV REPODEST /packages
