FROM fmasa/lebeda:7.1

MAINTAINER Frantisek Masa <frantisekmasa1@gmail.com>

RUN apt-get update

RUN apt-get install -y bzip2 build-essential chrpath libssl-dev libxft-dev \
 libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && apt-get install git-lfs && git lfs install

ENV PHANTOM_JS phantomjs-1.9.8-linux-x86_64

RUN curl -L https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 | tar xjf - -C /usr/local/share \
    && ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
        echo "deb https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    	echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list && \
    	apt-get update

RUN mkdir -p /usr/share/man/man1 && \
    apt-get install -y \
    xvfb \
	google-chrome-stable \
	fontconfig \
	fonts-ipafont-gothic \
	fonts-wqy-zenhei \
	fonts-thai-tlwg \
	fonts-kacst \
	fonts-noto \
	ttf-freefont \
	libcups2 \
	--no-install-recommends && \
	apt-get -t jessie-backports install -y openjdk-8-jre-headless ca-certificates-java && \
	rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm install selenium-standalone@latest -g && \
    selenium-standalone install
