CURRENT = $(shell uname -r)
KDIR = /lib/modules/$(CURRENT)/build
PWD = $(shell pwd)
DEST = /lib/modules/$(CURRENT)/misc
CC = gcc -Wall

TARGET = logic_bomb

obj-m      := $(TARGET).o

all: default

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

install:
	$(MAKE) -C $(KDIR) M=$(PWD) modules_install
	/sbin/depmod $(CURRENT)
