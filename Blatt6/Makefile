all: Aufgabe6_GrpNr121.pdf
	$(info ARTIFACTS:Aufgabe6_GrpNr121.pdf)

.PHONY: Aufgabe6_GrpNr121.pdf
Aufgabe6_GrpNr121.pdf: Aufgabe6_GrpNr121.tex
	latexmk -pdf Aufgabe6_GrpNr121.tex

.PHONY: clean
clean:
	latexmk -C

.PHONY: deploy
deploy: Aufgabe6_GrpNr121.pdf
	latexmk -c
