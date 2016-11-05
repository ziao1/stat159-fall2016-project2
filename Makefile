.PHONY: all data tests eda ols ridge lasso pcr plsr regressions report slides session clean

all: eda regressions report

data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Credit.csv -o "./data/Credit.csv"
ols:
	RScript ./code/scripts/ols.R
ridge:
	RScript ./code/scripts/ridge.R
lasso:
	RScript ./code/scripts/lasso.R
pcr:
	RScript ./code/scripts/pcr.R
plsr:
	RScript ./code/scripts/pls.R
regressions:
	make ols
	make ridge
	make lasso
	make pcr
	make plsr
report:
	pandoc ./report/sections/00-abstract.md ./report/sections/01-introduction.md ./report/sections/02-data.md ./report/sections/03-methods.md ./report/sections/04-analysis.md ./report/sections/05-results.md ./report/sections/06-conclusions.md -s -o ./report/report.pdf
clean:
	rm ./report/report.pdf
tests:
	RScript ./code/test-that/test/test-that.R
slides:
	RScript ./slides/slides.RMD
slides:
	pandoc ./slides/slides.RMD -s -o ./slides/slides.html