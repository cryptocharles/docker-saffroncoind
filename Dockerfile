from ubuntu:14.04
maintainer charles
run apt-get update
run apt-get install -y build-essential automake libcurl4-openssl-dev git libboost-all-dev libdb++-dev libminiupnpc-dev
RUN cd /; git clone https://github.com/saffroncoin/saffroncoin.git
RUN cd /saffroncoin/src; make -j2 -f makefile.unix
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh
EXPOSE 19710
EXPOSE 19717
CMD /start.sh; while true; do echo Hello world; sleep 1; done
