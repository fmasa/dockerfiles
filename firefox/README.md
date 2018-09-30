# Firefox + Selenium

Standalone Selenium + Firefox image with option to pass custom application host.

Normally this is not necessary, because [`--add-host` option](https://docs.docker.com/engine/reference/run/#managing-etchosts) can be used.
This image is useful in several CI tools that doesn't allow build container hostname to be set
as it allows to spin up service container with selenium and pass build container IP with it.
