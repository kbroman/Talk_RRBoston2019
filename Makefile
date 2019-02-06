STEM = rrcollab
R_OPTS=--no-save --no-restore --no-init-file --no-site-file

$(STEM).pdf: $(STEM).tex header.tex Figs/hs.pdf
	xelatex $<

Figs/hs.pdf: R/hs_fig.R
	cd $(<D);R $(R_OPTS) -e "source('$(<F)')"

all: $(STEM).pdf web

web: $(STEM).pdf
	scp $(STEM).pdf adhara.biostat.wisc.edu:Website/presentations/
	scp $(STEM).pdf adhara.biostat.wisc.edu:Website/presentations/$(STEM)_aaas2019.pdf
