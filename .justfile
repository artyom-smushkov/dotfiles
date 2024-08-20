piiq:
	#!/bin/bash
	cd ~/Development/piiq-dev-containers
	is_running=$(podman-compose ps | grep Up)
	if [ -z "$is_running" ]; then
	    podman-compose --in-pod False up -d --build
	fi
	podman exec -it piiq /bin/zsh
stop-piiq:
	#!/bin/bash
	cd ~/Development/piiq-dev-containers
	podman-compose --in-pod False down
# You can add your own commands here! For documentation, see: https://ublue.it/guide/just/
import "/usr/share/ublue-os/justfile"
