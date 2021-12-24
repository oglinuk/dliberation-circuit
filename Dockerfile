FROM alpine:latest
RUN apk update && apk add allegro-dev \
	build-base \
	cmake \
	git \
	make \
	mesa-dri-intel \
	sdl2-dev
RUN git clone https://github.com/linleyh/liberation-circuit.git
WORKDIR liberation-circuit
RUN make -j$(nproc)
RUN mkdir -p ~/.config/linleyh/libcirc
RUN cp ./bin/init.txt ~/.config/linleyh/libcirc/init.txt
WORKDIR bin
CMD ["./libcirc"]
