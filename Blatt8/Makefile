all: Aufgabe8_GrpNr121.pdf
	$(info ARTIFACTS:Aufgabe8_GrpNr121.pdf)

.PHONY: Aufgabe8_GrpNr121.pdf
Aufgabe8_GrpNr121.pdf: Aufgabe8_GrpNr121.tex
	latexmk -pdf Aufgabe8_GrpNr121.tex

.PHONY: clean
clean:
	latexmk -C

.PHONY: deploy
deploy: Aufgabe8_GrpNr121.pdf
	latexmk -c
