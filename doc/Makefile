PD=pandoc -F pandoc-crossref --pdf-engine=xelatex
all: postgres_docker.pdf \
	live_iso.pdf \
	fixed_ip.pdf

%.pdf: %.md
		$(PD) -o $@ $(HEAD) $<

clean:
	rm -rf *~
	rm -rf *pdf

