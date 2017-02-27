# include Makefile.win
include Makefile.in

MDDIR:= .
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

all: html

docx: $(DOCX)
$(DOCX): $(HTML)
	$(PANDOC) --reference-docx=$(REFERENCE) $(HTML) -o $(DOCX); \
	$(PYTHON) $(DOCXPWRTR) -I $(MDDIR)/$(INPUT) -O $(DOCX)

html: $(MDDIR)/$(TARGETDIR)/$(IMAGEDIR) $(HTML)
$(HTML): $(MDDIR)/$(TARGETDIR)/$(TARGET).md
	$(PANDOC) -S $(PANFLAGS) --self-contained -thtml5 --template=$(MISC)/github.html \
		$(FILTERED) -o $(HTML)

pdf: $(MDDIR)/$(TARGETDIR)/$(IMAGEDIR) $(MDDIR)/$(TARGETDIR)/$(TARGET).tex
	cd $(MDDIR)/$(TARGETDIR);\
	xelatex --no-pdf $(TARGET).tex; \
	xelatex $(TARGET).tex

linking: $(MDDIR)/$(TARGETDIR)/$(IMAGEDIR)
$(MDDIR)/$(TARGETDIR)/$(IMAGEDIR):
	rm -f $(MDDIR)/$(TARGETDIR)/$(IMAGEDIR); \
	cd $(MDDIR)/$(TARGETDIR);\
	ln -s ../$(IMAGEDIR)

tex: $(MDDIR)/$(TARGETDIR)/$(TARGET).tex
$(MDDIR)/$(TARGETDIR)/$(TARGET).tex: $(MDDIR)/$(TARGETDIR)/$(TARGET).md
	$(PANDOC) $(PANFLAGS) --template=$(MISC)/CJK_xelatex.tex --latex-engine=xelatex \
	$(MDDIR)/$(TARGETDIR)/$(TARGET).md -o $(MDDIR)/$(TARGETDIR)/$(TARGET).tex

merge: $(MDDIR)/$(TARGETDIR)/$(TARGET).md
$(MDDIR)/$(TARGETDIR)/$(TARGET).md: $(FILTERED)
	cat $(FILTERED) > $(MDDIR)/$(TARGETDIR)/$(TARGET).md

filtered: $(FILTERED)
$(FILTERED): $(MDDIR)/$(INPUT) $(MARKDOWN) $(TABLES) $(WAVEPNG)
	cat $< | $(PYTHON) $(FILTER) --mode tex --out $@

tables: $(TABLES)
$(MDDIR)/$(TARGETDIR)/%.tmd: $(MDDIR)/$(DATADIR)/%.csv
	$(PYTHON) $(CSV2TABLE) --file $< --out $@ --delimiter ','

wavedrom: $(WAVEPNG)
$(MDDIR)/$(WAVEDIR)/%.png: $(MDDIR)/$(TARGETDIR)/%.json
	phantomjs $(WAVEDROM) -i $< -p $@

yaml2json: $(WAVEJSON)
$(MDDIR)/$(TARGETDIR)/%.json: $(MDDIR)/$(DATADIR)/%.yaml
	$(PYTHON) $(PYWAVEOPTS) < $< > $@

$(MDDIR)/$(TARGETDIR):
	mkdir -p $(MDDIR)/$(TARGETDIR)
$(MDDIR)/$(DATADIR):
	mkdir -p $(MDDIR)/$(DATADIR)
$(MDDIR):
	mkdir -p $(MDDIR)
$(MDDIR)/$(IMAGEDIR):
	mkdir -p $(MDDIR)/$(IMAGEDIR)
$(MDDIR)/$(WAVEDIR):
	mkdir -p $(MDDIR)/$(WAVEDIR)

clean: $(MDDIR)/$(TARGETDIR)
	rm -rf $(MDDIR)/$(TARGETDIR)/* $(MDDIR)/$(WAVEDIR)/
	rm $(MDDIR)/$(IMAGEDIR)/*_r[+-]*.png
