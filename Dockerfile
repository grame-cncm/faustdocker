
########################################################################
########################################################################
#
#       		Minimal Faust in a docker
#                 (GRAME / Y. Orlarey)
#
########################################################################
########################################################################

# docker build -t grame/faust .
# docker run -v `pwd`:/tmp grame/faust foo.dsp

FROM alpine:latest 

RUN apk update 
RUN apk add --no-cache gcc musl-dev cmake g++ make git pkgconfig libexecinfo libexecinfo-dev

#COPY faust /faust
RUN git clone --depth 1 https://github.com/grame-cncm/faust.git
WORKDIR /faust
RUN git fetch && git checkout a8b732e3372429fac329d00e57045914c3476791
RUN make -C /faust/build cmake CMAKEOPT='-DFAUST_DEFINITIONS="-DALPINE"'
RUN make -C /faust/build 
RUN make -C /faust/build install

FROM alpine:latest

RUN apk add --no-cache libstdc++

COPY --from=0 /usr/local/bin/faust /usr/local/bin 
COPY --from=0 /usr/local/share/faust /usr/local/share/faust
WORKDIR /tmp

ENTRYPOINT [ "/usr/local/bin/faust" ]
CMD [ "-v" ]





########################################################################
# HowTo run this docker image
########################################################################
# For local tests:
#-----------------
# docker run -it -p 80:80 eu.gcr.io/faust-cloud-208407/faustservicecloud:latest
#
# For production:
#-----------------
# docker run -d --restart=always -p 80:80 eu.gcr.io/faust-cloud-208407/faustservicecloud:latest
