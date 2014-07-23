# Makefile to build PDF, Markdown, and plaintext CV from YAML.
#
# Brandon Amos <http://bamos.io> and Ellis Michael <http://ellismichael.com>

BLOG_DIR=$(HOME)/ellismichael.com
TEMPLATE_DIR=templates
BUILD_DIR=build

.PHONY: all viewpdf stage jekyll push clean

all: viewpdf

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/resume.tex: $(BUILD_DIR) $(TEMPLATE_DIR)/latex/* generate.py
	python generate.py

$(BUILD_DIR)/resume.pdf: $(BUILD_DIR) $(BUILD_DIR)/resume.tex
	latexmk -pdf -cd- -quiet -jobname=$(BUILD_DIR)/resume $(BUILD_DIR)/resume
	latexmk -c -cd $(BUILD_DIR)/resume

viewpdf: $(BUILD_DIR)/resume.pdf
	gnome-open $(BUILD_DIR)/resume.pdf

stage: $(BUILD_DIR)/resume.pdf
	cp $(BUILD_DIR)/resume.pdf $(BLOG_DIR)/assets/resume.pdf

jekyll: stage
	cd $(BLOG_DIR) && jekyll server

push: stage
	git -C $(BLOG_DIR) add $(BLOG_DIR)/data/cv.pdf
	git -C $(BLOG_DIR) add $(BLOG_DIR)/cv.md
	git -C $(BLOG_DIR) commit -m "Update vitae."
	git -C $(BLOG_DIR) push

clean:
	rm -rf $(BUILD_DIR)
