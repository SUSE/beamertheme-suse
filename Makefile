.PHONY: clean
all: suse-example.pdf

%.pdf : %.tex
	xelatex $<

clean:
	rm -f *.snm *.out *.toc *.pdf *.aux *.log *.nav

