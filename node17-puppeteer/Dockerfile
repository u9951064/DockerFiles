FROM node:17-slim
MAINTAINER josh@intentarget.com

WORKDIR /root/project

RUN apt-get update \
    && apt-get install -y cron libxshmfence-dev \
    && cron \
    && apt-get install -y wget gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN npm init -y \
    && npm install -g puppeteer --unsafe-perm=true --allow-root


CMD ["tail", "-f", "/dev/null"]
