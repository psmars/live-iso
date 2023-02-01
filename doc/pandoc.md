---
title: Notes on the use of pandoc
author: Pierre Smars
date: \today
fontfamily: cmbright
fontsize: 12pt
---

# Some useful commands

Convert a markdown file to pdf

```
pandoc -o pandoc.pdf pandoc.md
```

add a biliography

```
--bibliography=references.bib
```

international

```
--latex-engine=xelatex
```

add a template

```
--template=template.tex
```

include a yaml header

```
pandoc -o pandoc.pdf header.yaml pandoc.md
```

allow cross-referencing

```
-F pandoc-crossref
```
add metadata

```
exiftool -author="me" -keywords="key1,key2" -title="work" -subject="test"
```

resize pdf

```
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook \
	-dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf
```
