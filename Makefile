STEM = rrcollab

$(STEM).pdf: $(STEM).tex header.tex
	xelatex $<

all: $(STEM).pdf web

web: $(STEM).pdf
	scp $(STEM).pdf adhara.biostat.wisc.edu:Website/presentations/
	scp $(STEM).pdf adhara.biostat.wisc.edu:Website/presentations/$(STEM)_aaas2019.pdf
