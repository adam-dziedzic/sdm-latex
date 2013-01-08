.SUFFIXES: .pdf .tex
all: artykul.pdf
artykul.pdf: bibliografia.bib
.tex.pdf:
	xelatex $< \
		&& bibtex $(subst tex,aux,$<) \
		&& xelatex $< \
		&& xelatex $< \
		|| (rm -f $@; false)
clean:
	rm -f artykul.{pdf,aux,bbl,blg,log,out}
