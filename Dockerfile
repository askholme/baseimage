FROM debian:jessie

MAINTAINER Ask Holme <ask@askholme.dk

RUN mkdir /build
ADD . /build
RUN /build/prepare.sh && \
	/build/system_services.sh && \
	/build/cleanup.sh

CMD ["/sbin/my_init"]
