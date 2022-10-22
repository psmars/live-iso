PD=pandoc -F pandoc-crossref --pdf-engine=xelatex
all: \
	encryption.pdf \
	fixed_ip.pdf \
	live_iso.pdf \
	postgres_docker.pdf

%.pdf: %.md
		$(PD) -o $@ $(HEAD) $<

clean:
	rm -rf *~
	rm -rf *pdf

