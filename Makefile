.PHONY: clean
all: example.pdf

%.pdf : %.tex
	xelatex -interaction=nonstopmode $<

screenshots: example-0.png example-1.png example-2.png

example-0.png: example.pdf
	gs -dBATCH -dNOPAUSE -dSAFER -r600 -sDEVICE=pngalpha -sOutputFile=example-0.png -dFirstPage=1 -dLastPage=1 $<

clean:
	rm -f *.snm *.out *.toc *.pdf *.aux *.log *.nav *.vrb

