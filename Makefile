CHROME=google-chrome
FIREFOX=firefox
NAME=intercept-youtube-links
BUILDDIR=build
CFX=cfx

-include Makefile.user

.PHONY: all crx xpi userscript install install-crx install-xpi run-xpi clean

all: crx xpi userscript

install: install-crx install-xpi

install-crx: crx
	$(CHROME) --load-extension=$(BUILDDIR)/$(NAME).crx

install-xpi: xpi
	$(FIREFOX) $(BUILDDIR)/$(NAME).xpi

run-xpi: xpi
	$(CFX) run --pkgdir=$(BUILDDIR)/firefox

crx: $(BUILDDIR)/$(NAME).crx

xpi: $(BUILDDIR)/$(NAME).xpi

userscript: $(BUILDDIR)/$(NAME).user.js

$(BUILDDIR)/$(NAME).crx: content.js chrome/manifest.json chrome/$(NAME).pem
	mkdir -p $(BUILDDIR)/chrome
	cp content.js chrome/manifest.json $(BUILDDIR)/chrome
	$(CHROME) --pack-extension=$(BUILDDIR)/chrome --pack-extension-key=chrome/$(NAME).pem
	mv $(BUILDDIR)/chrome.crx $@

chrome/$(NAME).pem:
	mkdir -p $(BUILDDIR)/chrome
	cp content.js chrome/manifest.json $(BUILDDIR)/chrome
	$(CHROME) --pack-extension=$(BUILDDIR)/chrome
	mv $(BUILDDIR)/chrome.pem $@
	rm $(BUILDDIR)/chrome.crx

$(BUILDDIR)/$(NAME).xpi: content.js firefox/package.json firefox/lib/main.js
	mkdir -p $(BUILDDIR)/firefox/lib $(BUILDDIR)/firefox/data
	cp content.js $(BUILDDIR)/firefox/data
	cp firefox/lib/main.js $(BUILDDIR)/firefox/lib
	cp firefox/package.json $(BUILDDIR)/firefox
	$(CFX) xpi --pkgdir=$(BUILDDIR)/firefox --output-file=$@

$(BUILDDIR)/$(NAME).user.js: userscript/metadata.user.js content.js
	mkdir -p $(BUILDDIR)
	cat userscript/metadata.user.js content.js > $@

clean:
	rm -rf $(BUILDDIR)
