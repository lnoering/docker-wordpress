SHELL := /bin/bash

args = `arg="$(filter-out $(firstword $(MAKECMDGOALS)),$(MAKECMDGOALS))" && echo $${arg:-${1}}`

green  = $(shell printf "\e[32;01m$1\e[0m")
yellow = $(shell printf "\e[33;01m$1\e[0m")
red    = $(shell printf "\e[33;31m$1\e[0m")

format = $(shell printf "%-40s %s" "$(call green,bin/$1)" $2)

comma:= ,

.DEFAULT_GOAL:=help

%:
	@:

help:
	@echo ""
	@echo "$(call yellow,Use the following CLI commands:)"
	@echo "$(call red,===============================)"
	@echo "$(call format,bash,'Drop into the bash prompt of your Docker container.')"
	@echo "$(call format,cli,'Run any CLI command without going into the bash prompt.')"
	@echo "$(call format,clinotty,'Run any CLI command with no TTY.')"
	@echo "$(call format,cliq,'Run any CLI command but pipe all output to /dev/null.')"
	@echo "$(call format,copyfromcontainer,'Copy folders or files from container to host.')"
	@echo "$(call format,copytocontainer,'Copy folders or files from host to container.')"
	@echo "$(call format,fixowns,'This will fix filesystem ownerships within the container.')"
	@echo "$(call format,fixperms,'This will fix filesystem permissions within the container.')"
	@echo "$(call format,mysql,'Run the MySQL CLI with database config from env/db.env.')"
	@echo "$(call format,mysqldump,'Backup the WordPress database.')"
	@echo "$(call format,remove,'Remove all containers.')"
	@echo "$(call format,removeall,'Remove all containers$(comma) networks$(comma) volumes and images.')"
	@echo "$(call format,removevolumes,'Remove all volumes.')"
	@echo "$(call format,restart,'Stop and then start all containers.')"
	@echo "$(call format,root,'Run any CLI command as root without going into the bash prompt.')"
	@echo "$(call format,rootnotty,'Run any CLI command as root with no TTY.')"
	@echo "$(call format,start,'Start all containers.')"
	@echo "$(call format,status,'Check the container status.')"
	@echo "$(call format,stop,'Stop all containers.')"
	@echo "$(call format,update,'Update your project to the latest version of docker-wordpress.')"
	@echo "$(call format,setup-ssl,'Generate an SSL certificate for one or more domains.')"
	@echo "$(call format,setup-ssl-ca,'Generate a certificate authority and copy it to the host.')"
	@echo "$(call format,build,'Build images at local')"
	@echo "$(call format,wp,'WordPress CLI commands')"
	@echo "$(call format,download,'Download & extract specific WordPress version to the src directory.')"
	@echo "$(call format,setup,'Run the WordPress setup process$(comma) with optional domain name.')"
	@echo "$(call format,setup-domain,'Setup WordPress domain name.')"

bash:
	@./bin/bash

cli:
	@./bin/cli $(call args)

clinotty:
	@./bin/clinotty $(call args)

cliq:
	@./bin/cliq $(call args)

copyfromcontainer:
	@./bin/copyfromcontainer $(call args)

copytocontainer:
	@./bin/copytocontainer $(call args)

fixowns:
	@./bin/fixowns $(call args)

fixperms:
	@./bin/fixperms $(call args)

remove:
	@./bin/remove

removeall:
	@./bin/removeall

removevolumes:
	@./bin/removevolumes

restart:
	@./bin/restart $(call args)

root:
	@./bin/root $(call args)

rootnotty:
	@./bin/rootnotty $(call args)

start:
	@./bin/start $(call args)

status:
	@./bin/status

stop:
	@./bin/stop $(call args)

update:
	@./bin/update

setup-ssl:
	@./bin/setup-ssl $(call args)

setup-ssl-ca:
	@./bin/setup-ssl-ca

build:
	@./bin/build $(call args)
	
wp:
	@./bin/wp $(call args)

download:
	@./bin/download $(call args)

setup:
	@./bin/setup $(call args)

setup-domain:
	@./bin/setup-domain $(call args)

