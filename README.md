# docker-findmydeviceserver

[![GitHub license](https://img.shields.io/github/license/badranadam/docker-findmydeviceserver.svg)](https://github.com/badranadam/docker-findmydeviceserver/blob/master/LICENSE)
[![Build Status](https://drone.badran.xyz/api/badges/badranadam/docker-findmydeviceserver/status.svg?ref=refs/heads/main)](https://drone.badran.xyz/badranadam/docker-findmydeviceserver)
[![Docker Stars](https://img.shields.io/docker/stars/badranadam/findmydeviceserver)](https://hub.docker.com/r/badranadam/findmydeviceserver)
[![Docker Pulls](https://img.shields.io/docker/pulls/badranadam/findmydeviceserver)](https://hub.docker.com/r/badranadam/findmydeviceserver)

Simple docker container for running FindMyDeviceServer.


## How to use this image

### Start findmydeviceserver

The command starts FindMyDeviceServer and opens port 1020:

``docker run -d -p 1020:1020 -v /data/fmdserver:/fmd/objectbox --name tor badranadam/findmydeviceserver``

## Feedback
Please report any problems as issue on github: https://github.com/badranadam/docker-findmydeviceserver/issues

## Thanks
Thanks to [Nulide](https://gitlab.com/Nulide) for [FindMyDeviceServer](https://gitlab.com/Nulide/FindMyDeviceServer).
