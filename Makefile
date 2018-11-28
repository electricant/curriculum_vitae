PDFLATEX=pdflatex -file-line-error -halt-on-error
COLOR=| egrep --color=auto 'Warning|error|^'

all: en it

en: curriculum-en.pdf
it: curriculum-it.pdf

%.pdf: tex/%.tex
	@$(PDFLATEX) $< $(COLOR)
	@$(PDFLATEX) $< $(COLOR)
	@rm -f *.aux *.log

clean:
	@rm -f *.aux *.log *.pdf