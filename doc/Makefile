PD=pandoc -F pandoc-crossref --pdf-engine=xelatex
all: postgres_docker.pdf

%.pdf: %.md
		$(PD) -o $@ $(HEAD) $<

clean:
	rm -rf *~
	rm -rf *pdf

