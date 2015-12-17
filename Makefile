#Name that you would like for your resulting pdf file, without extension
PDFNAME = thesis
#The program that you use for viewing pdf files
PDFVIEWER = evince
#Change name of this if you change the name of demothesis.tex, should be name of the main tex file
TEXMAINFILE = demothesis.tex
#Location of latexmk binary
MKLATEX = latexmk
#Options to latexmk, should need to be changed
MKLATEXOPTS = -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make -jobname=$(PDFNAME)

all: $(PDFNAME).pdf

$(PDFNAME).pdf: $(TEXMAINFILE) *.tex
	$(MKLATEX) $(MKLATEXOPTS) $<

view: $(PDFNAME).pdf
	$(PDFVIEWER) $(PDFNAME).pdf &

clean:
	$(MKLATEX) -CA
	rm $(PDFNAME).pdf
