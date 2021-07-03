#!/bin/sh

build:
	docker build docker-image -t bacnh85/yocto-tegra

update:
	docker-compose up -d
	docker exec -it -u `id -u` yocto-tegra /bin/bash
