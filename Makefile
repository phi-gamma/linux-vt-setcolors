PREFIX=/usr/local
SCHEMES=example-colors/*

setcolors: setcolors.c
	gcc -Wall setcolors.c -o setcolors

install: setcolors setcolors.1
	install -Dm 755 setcolors "${DESTDIR}${PREFIX}/bin/setcolors"
	install -Dm 644 setcolors.1 "${DESTDIR}${PREFIX}/share/man/man1/setcolors.1"
	install -d "${DESTDIR}${PREFIX}/share/setcolors"
	install -Dm 644 $(SCHEMES) "${DESTDIR}${PREFIX}/share/setcolors/"

clean:
	rm setcolors
