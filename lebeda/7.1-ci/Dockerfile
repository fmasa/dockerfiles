FROM fmasa/lebeda:7.1

MAINTAINER Frantisek Masa <frantisekmasa1@gmail.com>

RUN apt-get update
ADD install_phantomjs.sh /install_phantomjs.sh
RUN chmod u+x /install_phantomjs.sh
RUN /install_phantomjs.sh
