# To create the image:
#   $ docker build -t z88dk -f z88dk.Dockerfile .
# To run the container:
#   $ docker run -v ${PWD}:/src/ -it z88dk <command>

FROM alpine:latest

LABEL Version="2.2" \
      Date="2023/06/11" \
      Docker_Version="24.0.2, build cb74dfc" \
      Maintainer="David Gonzalez Zornoza (https://github.com/dgzornoza)" \
      Description="Docker container with z88dk environment for visual studio dev-container"

ENV Z88DK_PATH="/opt/z88dk"

RUN apk add --no-cache build-base libxml2 m4 curl \
    && apk add --no-cache -t .build_deps bison flex libxml2-dev git subversion boost-dev texinfo \
		perl-template-toolkit perl-app-cpanminus \
    && git clone --depth 1 --recursive https://github.com/z88dk/z88dk.git ${Z88DK_PATH}

RUN cpanm -l $HOME/perl5 --no-wget local::lib Template::Plugin::YAML 

# extra-packages
RUN apk add perl && apk add git && apk add nano

# Add, edit or uncomment the following lines to customize the z88dk compilation
# COPY clib_const.m4 ${Z88DK_PATH}/libsrc/_DEVELOPMENT/target/
# COPY config_sp1.m4 ${Z88DK_PATH}/libsrc/_DEVELOPMENT/target/zx/config/

RUN cd ${Z88DK_PATH} \
	&& eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)" \
    && chmod 777 build.sh \
    && BUILD_SDCC=1 BUILD_SDCC_HTTP=1 ./build.sh \
    && apk del .build_deps

ENV PATH="${Z88DK_PATH}/bin:${PATH}" \
    ZCCCFG="${Z88DK_PATH}/lib/config/"

WORKDIR /workspaces/