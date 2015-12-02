PDFNAME = thesis
TEXMAINFILE = demothesis.tex
MKLATEX = latexmk
MKLATEXOPTS = -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make -jobname=$(PDFNAME)

all: $(PDFNAME).pdf

$(PDFNAME).pdf: $(TEXMAINFILE)
	$(MKLATEX) $(MKLATEXOPTS) $<

view: $(PDFNAME).pdf
	evince $(PDFNAME).pdf &

clean:
	$(MKLATEX) -CA
	rm $(PDFNAME).pdf
