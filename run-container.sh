#!/bin/bash
docker run -it --rm -e TYPE=tcp -e HOSTNAME=8.8.8.8 -e PORT=443 dragonsecurity/tcping

docker run -it --rm -e HOSTNAME=8.8.8.8 dragonsecurity/tcping