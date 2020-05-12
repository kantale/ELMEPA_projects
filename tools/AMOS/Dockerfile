FROM ubuntu:16.04

RUN apt-get update && apt-get install -y build-essential autotools-dev automake git libboost-graph-dev mummer libexpat1-dev libz-dev python qt4-default wget unzip vim 

RUN echo yes | cpan DBI XML::Parser Statistics::Descriptive 

RUN wget -N http://users.soe.ucsc.edu/~kent/src/blatSrc34.zip && \
	unzip blatSrc34.zip  && \
	(cd blatSrc && mkdir -p /root/bin/x86_64 && sed -i 's/-Werror//g' inc/common.mk  && make 'MACHTYPE = x86_64' && cp -puv /root/bin/x86_64/* /usr/local/bin/)


RUN git clone git://git.code.sf.net/p/amos/code amos-code && \
	(cd amos-code && ./bootstrap  && ./configure && make && make install)



	


