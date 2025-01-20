#!/bin/bash

CALIBRE_RELEASE="v7.16.0"

if [ ! -f /usr/bin/apt ]; then
cat <<-EOF
    ********************************************************
    ********************************************************
    *                                                      *
    *                         !!!!                         *
    *               this installation fo                   *
    *       calibre is only supported on images            *
    *             using an Ubuntu base image.              *
    *                                                      *
    ********************************************************
    ********************************************************
EOF
exit 0
fi

if ! dpkg -s xz-utils >/dev/null 2>&1; then
    PACKAGES="xz-utils ${PACKAGES}"
fi

if [ ! -L /usr/lib/x86_64-linux-gnu/libGL.so.1 ]; then
    PACKAGES="libgl1 libglx-mesa0 ${PACKAGES}"
fi

if [ ! -L /usr/lib/x86_64-linux-gnu/libxdamage.so.1 ]; then
    PACKAGES="libxdamage1 ${PACKAGES}"
fi

if [ ! -L /usr/lib/x86_64-linux-gnu/libEGL.so.1 ]; then
    PACKAGES="libegl1 ${PACKAGES}"
fi

if [ ! -L /usr/lib/x86_64-linux-gnu/libxkbcommon.so.0 ]; then
    PACKAGES="libxkbcommon0 ${PACKAGES}"
fi

if [ ! -L /usr/lib/x86_64-linux-gnu/libnss3.so ]; then
    PACKAGES="libnss3 ${PACKAGES}"
fi

if [ ! -L /usr/lib/x86_64-linux-gnu/libOpenGL.so.0 ]; then
    PACKAGES="libopengl0 ${PACKAGES}"
fi

if [ ! -L /usr/lib/x86_64-linux-gnu/libXcomposite.so.1 ]; then
    PACKAGES="libxcomposite1 ${PACKAGES}"
fi

if [ ! -L /usr/lib/x86_64-linux-gnu/libxkbfile.so.1 ]; then
    PACKAGES="libxkbfile1 ${PACKAGES}"
fi

if [ ! -L /usr/lib/x86_64-linux-gnu/libXrandr.so.2 ]; then
    PACKAGES="libxrandr2 ${PACKAGES}"
fi

if [ ! -L /usr/lib/x86_64-linux-gnu/libXtst.so.6 ]; then
    PACKAGES="libxtst6 ${PACKAGES}"
fi

if [ -n "${PACKAGES}" ]; then
    echo "**** Adding calibre dependencies ****"
    apt-get update
    apt-get install -y --no-install-recommends \
    ${PACKAGES}
else
    echo "**** Calibre dependencies already installed, skipping ****"
fi

export DEBIAN_FRONTEND="noninteractive"

echo "**** installing Calibre and dependancies ****"

if [ ! -e /usr/bin/calibre-server ] || [ "${CALIBRE_RELEASE}" != "$(cat /config/.CALIBRE_RELEASE || :)" ]; then
    echo "**** Installing/updating calibre ${CALIBRE_RELEASE} ****"
    rm -rf /app/calibre
    mkdir -p /app/calibre
    if [ "$(uname -m)" == "x86_64" ]; then
        URL="https://download.calibre-ebook.com/${CALIBRE_RELEASE:1}/calibre-${CALIBRE_RELEASE:1}-x86_64.txz"
        echo "Get $URL"
        curl -o \
            /tmp/calibre.txz -L \
            $URL
    elif [ "$(uname -m)" == "aarch64" ]; then
        URL="https://download.calibre-ebook.com/${CALIBRE_RELEASE:1}/calibre-${CALIBRE_RELEASE:1}-arm64.txz"
        echo "Get $URL"
        curl -o \
            /tmp/calibre.txz -L \
            $URL
    fi
    tar xf \
        /tmp/calibre.txz \
        -C /app/calibre
    rm /tmp/calibre.txz
    /app/calibre/calibre_postinstall
    echo "${CALIBRE_RELEASE}" > /config/.CALIBRE_RELEASE
else
    echo "**** Calibre already installed, skipping ****"
fi
