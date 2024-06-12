# Makefile for the thesis

LATEX  = pdflatex
BIBTEX = biber
SOURCE = main
FLAGS  = -enable-write18 -synctex=1 -interaction=nonstopmode -file-line-error
OUTDIR = out

pdf: main.tex
	$(LATEX) $(FLAGS) -output-directory=$(OUTDIR) $(SOURCE)

bib: main.tex bibliography.bib
	$(BIBTEX) -output-directory=$(OUTDIR) $(SOURCE)

pdf_shell_escape: main.tex
	$(LATEX) -shell-escape $(FLAGS) -output-directory=$(OUTDIR) $(SOURCE).tex

all:
	make pdf
	make bib
	make pdf
	make pdf

final: pdf_shell_escape bib pdf_shell_escape pdf_shell_escape

dir:
	mkdir -p out/content
	mkdir -p out/figures
	mkdir -p out/figures/externalized

# That's all folks!