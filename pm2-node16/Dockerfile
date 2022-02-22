FROM node:16.14.0-alpine3.15
LABEL maintainer="Josh Tsai <u9951064@gmail.com>"

# Install pm2
RUN npm install pm2 -g

# Expose ports needed to use Keymetrics.io
EXPOSE 80 443 43554

# Start pm2.json process file
CMD ["pm2-runtime", "start", "pm2.json"]
