.PHONY: clean
all: example.pdf

%.pdf : %.tex
	xelatex -interaction=nonstopmode $<

screenshots: example-0.png example-1.png example-2.png

example-0.png: example.pdf
	convert -density 300 example.pdf -resize 25% example.png

clean:
	rm -f *.snm *.out *.toc *.pdf *.aux *.log *.nav

