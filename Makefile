# include Makefile.win
include Makefile.in

MDDIR:= doc
DATADIR:= doc/data
TARGETDIR:= doc/Out

INPUT:= TITLE.md
TARGET = TARGET

CSV:= $(shell cd $(DATADIR); ls *.csv)
TABLES:= $(CSV:%.csv=$(TARGETDIR)/%.tmd)
FILTERED= $(INPUT:%.md=$(TARGETDIR)/%.fmd)
HTML:=$(TARGETDIR)/$(TARGET).html
DOCX:=$(TARGETDIR)/$(TARGET).docx

PANFLAGS += --toc
PANFLAGS += --listings
PANFLAGS += --number-sections --highlight-style=pygments
PANFLAGS += -M localfontdir=$(FONTDIR)
PANFLAGS += -M css=$(MISC)/github_css/github.css
PANFLAGS += -M short-hash=`git rev-parse --short HEAD`
PANFLAGS += -M tables=true

.PHONY: docx html filtered tables pdf tex merge clean

all: $(TARGETDIR) $(DATADIR) $(MDDIR) html

docx: $(DOCX)
$(DOCX): $(HTML)
	$(PANDOC) --reference-docx=$(REFERENCE) $(HTML) -o $(DOCX); \
	$(PYTHON) $(DOCXPWRTR) -I $(MDDIR)/$(INPUT) -O $(DOCX)

html: $(HTML)

$(HTML): $(TABLES) $(FILTERED)
	$(PANDOC) $(PANFLAGS) --self-contained -thtml5 --template=$(MISC)/github.html \
		$(FILTERED) -o $(HTML)

pdf: tex
	cd $(TARGETDIR); \
	rm -f ./images; \
	ln -s ../images; \
	xelatex $(TARGET).tex

tex: merge $(TARGETDIR)/$(TARGET).tex
$(TARGETDIR)/$(TARGET).tex:
	$(PANDOC) $(PANFLAGS) --template=$(MISC)/CJK_xelatex.tex --latex-engine=xelatex \
		$(TARGETDIR)/$(TARGET).md -o $(TARGETDIR)/$(TARGET).tex; \
	xelatex --output-directory=$(TARGETDIR) --no-pdf $(TARGETDIR)/$(TARGET).tex

merge: filtered $(TARGETDIR)/$(TARGET).md
$(TARGETDIR)/$(TARGET).md:
	cat $(FILTERED) > $(TARGETDIR)/$(TARGET).md

filtered: $(MDDIR) $(TABLES) $(FILTERED)
$(FILTERED): $(MDDIR)/$(INPUT)
	cat $< | $(PYTHON) $(FILTER) --out $@

tables: $(TARGETDIR) $(DATADIR) $(TABLES)
$(TARGETDIR)/%.tmd: $(DATADIR)/%.csv
	$(PYTHON) $(CSV2TABLE) --file $< --out $@ --delimiter ','

$(TARGETDIR):
	mkdir -p $(TARGETDIR)
$(DATADIR):
	mkdir -p $(DATADIR)
$(MDDIR):
	mkdir -p $(MDDIR)

clean: $(TARGETDIR)
	rm -rf $(TARGETDIR)/*
