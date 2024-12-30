FROM node:22-bookworm-slim
LABEL auther="Shkong"

ARG VERSION
ARG HASH
ARG ARCH

ENV QQ_VERSION=${VERSION}
ENV QQ_HASH=${HASH}
ENV QQ_ARCH=${ARCH}

RUN apt-get update && apt-get install -y \
    wget \
    gdebi-core \
    ca-certificates \
    xvfb \
 && rm -rf /var/lib/apt/lists/*

RUN update-ca-certificates

RUN wget -O /tmp/linuxqq.deb https://dldir1.qq.com/qqfile/qq/QQNT/${QQ_HASH}/linuxqq_${QQ_VERSION}_${QQ_ARCH}.deb \
 && gdebi -n /tmp/linuxqq.deb \
 && rm /tmp/linuxqq.deb

WORKDIR /app

CMD ["node"]