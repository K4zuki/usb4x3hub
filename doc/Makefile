ifeq ($(OS),Windows_NT)
HOME = C:/Users/$(USERNAME)
endif
PANSTYLES= $(HOME)/.pandoc
MISC= $(PANSTYLES)/pandoc_misc
include $(MISC)/Makefile.in

MDDIR=.
DATADIR:= data
TARGETDIR:= Out
IMAGEDIR:= images
WAVEDIR:= waves
BITDIR:= bitfields

INPUT:= TITLE.md
TARGET:= TARGET

include $(MISC)/Makefile
