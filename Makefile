STEM = rrboston
R_OPTS=--no-save --no-restore --no-init-file --no-site-file

$(STEM).pdf: $(STEM).tex header.tex
	xelatex $<

Figs/%.pdf: R/%_fig.R
	cd $(<D);R $(R_OPTS) -e "source('$(<F)')"

notes: $(STEM)_withnotes.pdf
all: $(STEM).pdf notes web

$(STEM)_withnotes.tex: $(STEM).tex Ruby/createVersionWithNotes.rb
	Ruby/createVersionWithNotes.rb $(STEM).tex $(STEM)_withnotes.tex

$(STEM)_withnotes.pdf: $(STEM)_withnotes.tex header.tex
	xelatex $(STEM)_withnotes
	pdfnup $(STEM)_withnotes.pdf --nup 1x2 --no-landscape --paper letterpaper --frame true --scale 0.9
	mv $(STEM)_withnotes-nup.pdf $(STEM)_withnotes.pdf

web: $(STEM).pdf notes
	scp $(STEM)_withnotes.pdf adhara.biostat.wisc.edu:Website/presentations/$(STEM)2019.pdf
	scp $(STEM).pdf adhara.biostat.wisc.edu:Website/presentations/$(STEM)2019_nonotes.pdf
