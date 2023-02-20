PD=pandoc -F pandoc-crossref --pdf-engine=xelatex
all: \
	docker.pdf \
	encryption.pdf \
	fixed_ip.pdf \
	live_iso.pdf \
	pandoc.pdf \
	postgres_docker.pdf \
	postgres_qgis.pdf \
	qemu.pdf

%.pdf: %.md
		$(PD) -o $@ $(HEAD) $<

.PHONY: clean

clean:
	rm -rf *~
	rm -rf *pdf

