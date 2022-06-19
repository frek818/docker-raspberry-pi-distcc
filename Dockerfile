FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND "noninteractive"
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
	distcc \
	gcc-aarch64-linux-gnu \
    && useradd distcc \
    && apt-get clean 

EXPOSE 3632
EXPOSE 3633

USER distcc

ENV DISTCC_EXTRA_OPTIONS ""

ENTRYPOINT /usr/bin/distccd --no-detach --daemon --stats --log-level info --log-stderr $DISTCC_EXTRA_OPTIONS
