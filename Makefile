MAKEFILE_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
include $(wildcard $(MAKEFILE_DIR)**/Makefile)
