ARG NODE_VERSION=12.18.3
ARG NPM_VERSION=6.14.6

FROM node:$NODE_VERSION-alpine AS node
FROM wordpress-phpfpm:8.0-0 AS php

COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/share /usr/local/share
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

# RUN apk update && apk upgrade
# RUN apk add nodejs npm

# RUN npm install -g node@${NODE_VERSION}
# RUN npm install -g npm@${NPM_VERSION}

ADD image/entrypoint/node/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["npm", "--version"]