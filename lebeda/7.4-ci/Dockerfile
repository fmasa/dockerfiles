FROM fmasa/lebeda:7.4

LABEL maintainer="frantisekmasa1@gmail.com"

# Install build tools
RUN apt-get update && apt-get install -y \
        gnupg2 \
        apt-transport-https \
        gettext-base \
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
	    fonts-freefont-ttf \
	    libcups2 \
	&& rm -rf /var/lib/apt/lists/*

# Install Selenium
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && mkdir -p /usr/share/man/man1 \
    && apt-get install --no-install-recommends -y \
        nodejs \
        openjdk-11-jre-headless \
        ca-certificates-java \
    && npm install selenium-standalone@latest yarn -g \
    && selenium-standalone install \
	&& rm -rf /var/lib/apt/lists/*

