
.DELETE_ON_ERROR:

MAIN=par_comp
TEX_SOURCES = *.tex
BIB_SOURCES = *.bib

.PHONY: all
all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).ps
	ps2pdf $<

$(MAIN).ps: $(MAIN).dvi
	dvips -P pdf -G0 $<

$(MAIN).dvi: $(TEX_SOURCES) $(BIB_SOURCES)
	latex $(MAIN).tex
	bibtex $(MAIN)
	latex $(MAIN).tex
	latex $(MAIN).tex


.PHONY: clean
clean:
	rm -f $(MAIN).aux $(MAIN).bak $(MAIN).bbl $(MAIN).blg $(MAIN).dvi $(MAIN).log $(MAIN).ps
