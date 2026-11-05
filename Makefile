LATEX ?= tectonic

.PHONY: all article example dist clean

all: article

article:
	mkdir -p build
	$(LATEX) -o build article.tex

example:
	mkdir -p example/build
	cd example && $(LATEX) -o build example.tex

# Zip for Overleaf: article sources and class. The teacher's sample stays out.
dist: 
	rm -rf dist
	mkdir -p dist/misis-article
	cp misisarticle.cls article.tex references.tex README.md LICENSE dist/misis-article/
	cp -r sections paper dist/misis-article/
	cd dist && zip -r misis-article.zip misis-article
	rm -rf dist/misis-article

clean:
	rm -rf build example/build dist
	rm -f *.aux *.log *.out *.toc *.bbl *.blg *.bcf *.run.xml *.xdv *.synctex.gz *.fls *.fdb_latexmk
	rm -f article.pdf example/example.pdf
