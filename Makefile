MDDIR:= doc
DATADIR:= data
TARGETDIR:= Out
IMAGEDIR:= images
WAVEDIR:= images/waves

INPUT:= TITLE.md
TARGET = USB4x3HUB

CSV:= $(shell cd $(MDDIR)/$(DATADIR); ls *.csv)
TABLES:= $(CSV:%.csv=$(MDDIR)/$(TARGETDIR)/%.tmd)

WAVEYAML:= $(shell cd $(MDDIR)/$(DATADIR); ls *.yaml)
PYWAVEOPTS:= -c
PYWAVEOPTS += 'import sys, yaml, json; \
							json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)'
WAVEJSON:= $(WAVEYAML:%.yaml=$(MDDIR)/$(TARGETDIR)/%.json)
WAVEPNG:= $(WAVEYAML:%.yaml=$(MDDIR)/$(WAVEDIR)/%.png)

FILTERED= $(INPUT:%.md=$(MDDIR)/$(TARGETDIR)/%.fmd)
HTML:=$(MDDIR)/$(TARGETDIR)/$(TARGET).html
DOCX:=$(MDDIR)/$(TARGETDIR)/$(TARGET).docx

PANFLAGS += --toc
PANFLAGS += --listings
PANFLAGS += --number-sections --highlight-style=pygments
PANFLAGS += -M localfontdir=$(FONTDIR)
PANFLAGS += -M css=$(MISC)/github_css/github.css
PANFLAGS += -M short-hash=`git rev-parse --short HEAD`
PANFLAGS += -M tables=true

MARKDOWN = $(shell ls $(MDDIR)/*.md)

.PHONY: docx html filtered tables pdf tex merge clean linking

ifeq ($(OS),Windows_NT)
MAKE= make-4.1_64bit.exe
else
MAKE= make
endif

all: html

docx:
	cd $(MDDIR);\
	$(MAKE) docx

html:
	cd $(MDDIR);\
	$(MAKE) html

pdf:
	cd $(MDDIR);\
	$(MAKE) pdf

linking:
	cd $(MDDIR);\
	$(MAKE) linking

tex:
	cd $(MDDIR);\
	$(MAKE) tex

merge:
	cd $(MDDIR);\
	$(MAKE) merge

filtered:
	cd $(MDDIR);\
	$(MAKE) filtered

tables:
	cd $(MDDIR);\
	$(MAKE) tables

wavedrom:
	cd $(MDDIR);\
	$(MAKE) wavedrom

yaml2json:
	cd $(MDDIR);\
	$(MAKE) yaml2json

clean:
	cd $(MDDIR);\
	$(MAKE) clean
