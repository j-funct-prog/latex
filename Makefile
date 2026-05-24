#
# Makefile for jfp-epi package, based on acmart
#
# This file is in public domain
#

PACKAGE=jfp-epi

PDF = $(PACKAGE).pdf 

all:  $(PACKAGE).dtx $(PACKAGE).ins $(PACKAGE).cls $(PACKAGE)-guide.pdf

%.pdf:  %.dtx   $(PACKAGE).cls
	pdflatex $<
	- bibtex $*
	pdflatex $<
	pdflatex $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done

jfp-epi-guide.pdf: $(PACKAGE).dtx $(PACKAGE).cls
	pdflatex -jobname jfp-epi-guide $(PACKAGE).dtx
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' jfp-epi-guide.log) \
	do pdflatex -jobname jfp-epi-guide $(PACKAGE).dtx; done

%.cls:   %.ins %.dtx
	pdflatex $<

.PRECIOUS:  $(PACKAGE).cfg $(PACKAGE).cls

jfptemplate: $(PACKAGE).cls
	latexmk -pdf jfptemplate -shell-escape

jfptemplate-biblatex: $(PACKAGE).cls
	latexmk -pdf jfptemplate-biblatex -shell-escape

docclean:
	$(RM)  *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.cut *.hd \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi *.xcp

clean: docclean
	$(RM)  $(PACKAGE).cls 
	latexmk -bibtex -C

distclean: clean
	$(RM)  *.pdf 
	$(RM) -fr jfp-epi

distrib: all jfptemplate jfptemplate-biblatex docclean
	$(RM) -fr jfp-epi
	mkdir jfp-epi
	cp README-jfp.txt \
	jfp-epi.cls jfp-cup2epi.sty \
	jfp-epi-guide.pdf jfptemplate.pdf \
	jfptemplate.tex jfptemplate.bib jfptemplate-biblatex.tex \
	jfp-epi
	zip -r jfp-epi.zip jfp-epi
	$(RM) -fr jfp-epi

