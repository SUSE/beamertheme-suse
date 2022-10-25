# add to PROJECTS variable all the projects to compile, without the .tex suffix
PROJECTS = example

BUILDDIR = build
OUTPUT_IMAGESDIR = $(BUILDDIR)/outputimages
DOCUMENTS = $(addprefix $(BUILDDIR)/,$(addsuffix .pdf,$(PROJECTS)))
SCREENSHOTS = $(addprefix $(OUTPUT_IMAGESDIR)/, $(patsubst %,%-screenshot,$(PROJECTS)))


all: documents screenshots

documents: $(DOCUMENTS)

$(BUILDDIR)/%.pdf: %.tex | $(BUILDDIR)
	xelatex -interaction=nonstopmode -output-directory=$(BUILDDIR) $<

screenshots:	$(SCREENSHOTS)

$(OUTPUT_IMAGESDIR)/%-screenshot: $(BUILDDIR)/%.pdf
	gs -dBATCH -dNOPAUSE -dSAFER -r600 -sDEVICE=pngalpha -sOutputFile=$(OUTPUT_IMAGESDIR)/$*-%d.png $<
	touch $@

$(BUILDDIR):
	mkdir -p $(BUILDDIR) $(OUTPUT_IMAGESDIR)

clean:
	rm -f $(BUILDDIR)/{*.snm,*.out,*.toc,*.pdf,*.aux,*.log,*.nav,*.vrb} $(OUTPUT_IMAGESDIR)/*

.PHONY: all clean screenshots dir test
