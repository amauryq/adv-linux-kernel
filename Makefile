obj-m := simplemodule.o

MODULE = simplemodule

prereqs:
	sudo apt-get update
	sudo apt-get upgrade
	sudo apt-get install build-essential raspberrypi-kernel-headers libssl-dev pkg-config -y
# maybe this is not needed
#	sudo mkdir /lib/modules/$(uname -r)/build
#	sudo ln -s /usr/src/linux-headers-$(uname -r) /lib/modules/$(uname -r)/build

install: ## install
	sudo insmod $(MODULE).ko number=1 word="banana"

info:
	modinfo $(MODULE).ko

remove: ## remove
	sudo rmmod $(MODULE)

test: ## tesing. look at the `dmesg` output
	dmesg
