FROM fmasa/lebeda:7.3

LABEL maintainer="frantisekmasa1@gmail.com"

# Install build tools
RUN apt-get update && apt-get install -y \
        gnupg2 \
        apt-transport-https \
	&& rm -rf /var/lib/apt/lists/*

# Install Google Chrome
RUN curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update && apt-get install --no-install-recommends -y \
	    google-chrome-stable \
	    fontconfig \
	    fonts-ipafont-gothic \
	    fonts-wqy-zenhei \
	    fonts-thai-tlwg \
	    fonts-kacst \
	    fonts-noto \
	    ttf-freefont \
	    libcups2 \
	&& rm -rf /var/lib/apt/lists/*

# Install Selenium
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && mkdir -p /usr/share/man/man1 \
    && apt-get install --no-install-recommends -y \
        nodejs \
        openjdk-8-jre-headless \
        ca-certificates-java \
    && npm install selenium-standalone@latest -g \
    && selenium-standalone install \
	&& rm -rf /var/lib/apt/lists/*

# Instal ssh extension
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        libssl-dev \
        libssh2-1 \
        libssh2-1-dev \
    && pecl install ssh2-1.1.2 \
    && echo "extension=ssh2.so" > $PHP_INI_DIR/conf.d/ext-ssh2.ini \
	&& rm -rf /var/lib/apt/lists/*

