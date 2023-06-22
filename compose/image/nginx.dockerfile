FROM nginx:1.24.0-alpine
#stable-alpine

ADD ./conf/nginx/default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /etc/nginx/certs
COPY ./conf/nginx/certs /etc/nginx/certs/

RUN cd /tmp

RUN apk --no-cache add  \
        wget            \
        ca-certificates \
        libstdc++

ARG APK_GLIBC_VERSION=2.29-r0
ARG APK_GLIBC_FILE="glibc-${APK_GLIBC_VERSION}.apk"
ARG APK_GLIBC_BIN_FILE="glibc-bin-${APK_GLIBC_VERSION}.apk"
ARG APK_GLIBC_BASE_URL="https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${APK_GLIBC_VERSION}"
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget "${APK_GLIBC_BASE_URL}/${APK_GLIBC_FILE}"       \
    && apk --no-cache add --force-overwrite "${APK_GLIBC_FILE}"               \
    && wget "${APK_GLIBC_BASE_URL}/${APK_GLIBC_BIN_FILE}"   \
    && apk --no-cache add  --force-overwrite "${APK_GLIBC_BIN_FILE}"           \
    && rm glibc-*
    
### #AnthonyMastrean https://github.com/FiloSottile/mkcert/issues/169
RUN mkdir -p /root/.local/share/mkcert/

RUN cd /root/.local/share/mkcert/

RUN set -ex \
    && wget -q -O mkcert    https://github.com/FiloSottile/mkcert/releases/download/v1.3.0/mkcert-v1.3.0-linux-amd64 \
    && chmod +x mkcert

RUN mv ./mkcert /bin

RUN mkdir -p /var/www/html