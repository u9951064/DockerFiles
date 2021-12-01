FROM node:17-slim
MAINTAINER josh@intentarget.com

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

RUN groupadd -r pptruser && useradd -r -g pptruser -G audio,video,root,node pptruser

RUN mkdir -p /home/project \
    mkdir -p /home/pptruser \
    && chown -R pptruser:pptruser /home/project \
    && chown -R pptruser:pptruser /home/pptruser \
    && chmod -R 775 /home/project \
    && chmod -R 775 /home/pptruser

USER pptruser
WORKDIR /home/pptruser

RUN npm config set prefix '~/.local/'

RUN mkdir -p ~/.local/bin

RUN echo 'export PATH=~/.local/bin/:$PATH' >> ~/.bashrc

RUN npm init -y \
    && npm install -g puppeteer --unsafe-perm=true

WORKDIR /home/project

CMD ["tail", "-f", "/dev/null"]
