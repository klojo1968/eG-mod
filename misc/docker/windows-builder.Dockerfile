FROM docker.io/library/ubuntu:23.10
RUN apt-get update && apt-get install -y --no-install-recommends \
	autoconf \
	bash \
	ca-certificates \
	cmake \
	git \
	make \
	nasm \
	zip \
	unzip \
	g++-mingw-w64 \
	gcc-mingw-w64 \
	&& rm -rf /var/lib/apt/lists/*
