FROM alpine:3.15

RUN apk add \
    jack \
    jack-dev \
    git \
    vim \
    alsa-lib-dev \
    boost-dev  \
    boost-static  \
    cmake  \
    eudev-dev  \
    fftw-dev  \
    libsndfile-dev  \
    libxt-dev  \
    linux-headers  \
    ncurses-dev  \
    portaudio-dev  \
    readline-dev  \
    samurai  \
    yaml-cpp-dev \
    g++ \
    patch \
    make

ARG branch=3.12

WORKDIR /root/

COPY sc-alpine.patch .

RUN git clone \
    --depth 1 \
    --branch $branch \
    https://github.com/SuperCollider/SuperCollider.git && \
    cd SuperCollider && \
    # apply submodule fix
    # see https://github.com/supercollider/supercollider/issues/5695#issuecomment-1072263846
    sed -i "s|git://|https://|g" .gitmodules && \
    git submodule update --init --recursive && \
    mkdir -p /root/SuperCollider/build && \
    # apply patch for alpine, see
    # https://github.com/supercollider/supercollider/issues/5197#issuecomment-1047188442
    patch < /root/sc-alpine.patch && \
    cd /root/SuperCollider/build && \
    cmake \
        -DCMAKE_BUILD_TYPE=Debug \
        -DSUPERNOVA=OFF \
        -DSC_ED=OFF \
        -DSC_EL=OFF \
        -DSC_VIM=ON \
        -DNATIVE=ON \
        -DSC_IDE=OFF \
        -DNO_X11=ON \
        -DSC_ABLETON_LINK=OFF \
        -DSC_QT=OFF .. && \
	cmake --build . --config Debug --target all -j${MAKE_JOBS} && \
    cmake --build . --config Debug --target install -j${MAKE_JOBS} && \
    rm -rf /root/SuperCollider

ADD run_tests.sh .
ADD test.sc.template .

CMD [ "sclang" ]
