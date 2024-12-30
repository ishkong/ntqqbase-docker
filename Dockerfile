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
    ca-certificates \
    xvfb \
    libgtk-3-dev \
    libasound2-dev \
    libgbm-dev \
    libnss3-dev \
    libdbus-1-3 \
    libatk1.0-0 \
    dbus \
    dbus-x11 \
    libcups2-dev \
    libatk-bridge2.0-dev \
    libsecret-1-0 \
    libxss1 \
    libnotify4 \
    xdg-utils \
 && rm -rf /var/lib/apt/lists/*

RUN update-ca-certificates

RUN wget -O /tmp/linuxqq.deb https://dldir1.qq.com/qqfile/qq/QQNT/${QQ_HASH}/linuxqq_${QQ_VERSION}_${QQ_ARCH}.deb \
 && dpkg -i --force-depends /tmp/linuxqq.deb \
 && rm /tmp/linuxqq.deb

WORKDIR /app

CMD ["node"]