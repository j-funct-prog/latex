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


docclean:
	$(RM)  *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.cut *.hd \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi


clean: docclean
	$(RM)  $(PACKAGE).cls 


distclean: clean
	$(RM)  *.pdf 


distrib: all docclean
	zip -r jfp-epi.zip  \
	README-jfp.txt \
	jfp-epi.cls jfp-cup2epi.sty jfp-logo.pdf \
	jfp-epi-guide.pdf \
	jfptemplate.tex jfptemplate.bib jfptemplate.pdf

