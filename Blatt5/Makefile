all: Aufgabe5_GrpNr121.pdf
	$(info ARTIFACTS:Aufgabe5_GrpNr121.pdf)

.PHONY: Aufgabe5_GrpNr121.pdf
Aufgabe5_GrpNr121.pdf: Aufgabe5_GrpNr121.tex
	latexmk -pdf Aufgabe5_GrpNr121.tex

.PHONY: clean
clean:
	latexmk -C

.PHONY: deploy
deploy: Aufgabe5_GrpNr121.pdf
	latexmk -c
