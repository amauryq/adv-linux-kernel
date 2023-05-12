obj-m := simplemodule.o

MODULE = simplemodule

prereqs: # prepare server with prerequisites
	sudo apt-get update
	sudo apt-get upgrade
	sudo apt-get install build-essential raspberrypi-kernel-headers libssl-dev pkg-config -y
# maybe this is not needed
#	sudo mkdir /lib/modules/$(uname -r)/build
#	sudo ln -s /usr/src/linux-headers-$(uname -r) /lib/modules/$(uname -r)/build

copy: ## copy to remote
	ssh bumblebee mkdir -p adv-linux-kernel
	scp -r Makefile make-module.sh $(MODULE).c bumblebee:adv-linux-kernel/

install: ## install
	sudo insmod $(MODULE).ko number=1 word="banana"

info: ## display module information
	modinfo $(MODULE).ko

remove: ## remove module from memory
	sudo rmmod $(MODULE)

test: ## tesing. look at the `dmesg` output
	dmesg
