VERSION ?= 1.3.8-1

staging = $(CURDIR)/staging
build = $(CURDIR)/build

cmake_opts = \
	-DCMAKE_INSTALL_PREFIX=$(staging) \
	-DCMAKE_BUILD_TYPE=Release \
	-DOPEN62541_VERSION=v$(VERSION)

define control
Package: open62541-dev
Version: $(VERSION)
Architecture: amd64
Maintainer: Stratus Technologies
Description: OPC UA development library and header files
endef

export control

open62541-dev_$(VERSION)_amd64.deb:
	mkdir -p $(build)
	cd $(build); cmake $(cmake_opts) ..
	$(MAKE) -C $(build)
	$(MAKE) -C $(build) install
	mkdir -p $(staging)/DEBIAN
	echo "$$control" > $(staging)/DEBIAN/control
	dpkg-deb --root-owner-group --build $(staging) $@

clean:
	$(RM) -r $(build)
	$(RM) -r $(staging)
	$(RM) open62541-dev_$(VERSION)_amd64.deb

.PHONY: clean
