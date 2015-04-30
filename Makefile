FILE = main

all: $(FILE).pdf

.PHONY: clean

$(FILE).pdf: $(FILE).tex 
	pdflatex $(FILE)
$(FILE).dvi: 
	latex $(FILE)

$(FILE).ps: $(FILE).dvi
	dvips -Ppdf $(FILE).dvi -o $(FILE).ps

newcite: parts/refs.bib $(FILE).pdf 
	bibtex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)
	
force:
	pdflatex $(FILE)
	bibtex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)
	
clean:
	rm -f $(FILE).aux $(FILE).bbl $(FILE).blg $(FILE).dvi $(FILE).log $(FILE).pdf $(FILE).ps
	rm -f parts/*.aux *.log *.aux *.lof *.lot *.fls *.out *.toc
	rm -f imgs/*-converted-to.*
