FROM golang:bullseye AS build

ARG FMD_VERSION

RUN \
  mkdir -p /go/src/gitlab.com/Nulide/findmydeviceserver/ && \
  mkdir -p /rootfs/fmd/objectbox /rootfs/usr/lib

ADD https://gitlab.com/Nulide/findmydeviceserver/-/archive/${FMD_VERSION}/findmydeviceserver-${FMD_VERSION}.tar.gz /go/src/gitlab.com/Nulide/findmydeviceserver-${FMD_VERSION}.tar.gz

WORKDIR /go/src/gitlab.com/Nulide/

RUN \
  tar -zxf findmydeviceserver-${FMD_VERSION}.tar.gz -C findmydeviceserver --strip-components 1 && \
  cd findmydeviceserver && \
  go mod tidy && \
  wget https://raw.githubusercontent.com/objectbox/objectbox-go/main/install.sh && \
  chmod +x install.sh && \
  (yes | ./install.sh ;) || exit_code=$? && \
  cd cmd/ && \
  go build fmdserver.go && \
  mv ../extra ../web fmdserver /rootfs/fmd/ && \
  mv /usr/lib/libobjectbox.so /rootfs/usr/lib/libobjectbox.so

FROM debian:bullseye-slim

WORKDIR /root
COPY --from=build /rootfs / 

RUN \
  apt update && \
  apt install wget -y

EXPOSE 1020/tcp

HEALTHCHECK  --start-period=3s --interval=5s --timeout=4s --retries=5 \
  CMD [ "/usr/bin/wget", "--quiet", "--timeout=3", "--tries=1", "--spider", "http://127.0.0.1:1020/"]

VOLUME /fmd/objectbox

ENTRYPOINT [ "/fmd/fmdserver" ]
