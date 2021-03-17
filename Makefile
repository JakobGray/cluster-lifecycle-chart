# Copyright Contributors to the Open Cluster Management project

CHART_NAME ?= cluster-liecycle
STABLE_CHART ?= stable/$(CHART_NAME)

SHELL := /bin/bash

VERSION ?= ${SEMVERSION}
CHART_FILE ?= $(CHART_NAME)-$(VERSION).tgz

.PHONY: build lint 

CHART_VERSION := $(SEMVERSION)

lint:
	helm lint $(STABLE_CHART)

.PHONY: build
## Packages helm-api folder into chart archive
build: lint
	mkdir -p repo/stable
	@echo "BUILD CHART_NAME: $(CHART_NAME)"
	@echo "BUILD CHART_VERSION: 99.99.99"
	helm package --version 99.99.99 $(STABLE_CHART) -d $(STABLE_BUILD_DIR)
