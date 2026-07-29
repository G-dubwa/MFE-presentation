MAIN := main
OUTPUT := build/Group5_Deep_Hedging_Presentation.pdf

.PHONY: all clean distclean

all: $(OUTPUT)

$(OUTPUT): $(MAIN).tex presentation_theme.sty references.bib $(wildcard sections/*.tex)
	mkdir -p build
	latexmk -pdf -interaction=nonstopmode -halt-on-error $(MAIN).tex
	cp $(MAIN).pdf $(OUTPUT)

clean:
	latexmk -c $(MAIN).tex

distclean:
	latexmk -C $(MAIN).tex
	rm -f $(OUTPUT)
