shelf: gds_pysal san sdsr 
gds_pysal:
	# Clean pre
	rm -rf gds_pysal
	# Pull down
	wget https://github.com/gdsbook/book/archive/master.zip
	unzip master.zip
	mv book-master gds_pysal
	rm master.zip
	# Remove .md files
	mv gds_pysal/notebooks/00_toc.md gds_pysal/notebooks/00_toc.tmp
	cd gds_pysal/notebooks && rm *.md
	mv gds_pysal/notebooks/00_toc.tmp gds_pysal/notebooks/00_toc.md
san:
	# Clean pre
	rm -rf san
	# Pull down
	wget https://github.com/GDSL-UL/san/archive/master.zip
	unzip master.zip
	mv san-master san
	rm master.zip
	# .Rmd --> .md --> .ipynb
	cd san && \
		jupytext --to notebook \
			 --warn-only \
			 --set-kernel ir \
			 *.Rmd
	# Remove Rmarkdown to lighten folder
	cd san && rm *.Rmd
geocompr:
	# Clean pre
	rm -rf geocompr
	# Pull down
	wget https://github.com/Robinlovelace/geocompr/archive/master.zip
	unzip master.zip
	mv geocompr-master geocompr
	rm master.zip
	# .Rmd --> .md --> .ipynb
	cd geocompr && \
		jupytext --to notebook \
			 --warn-only \
			 --set-kernel ir \
			 *.Rmd
	# Remove Rmarkdown to lighten folder
	cd geocompr && rm *.Rmd
sdsr:
	# Clean pre
	rm -rf sdsr
	# Pull down
	wget https://github.com/edzer/sdsr/archive/master.zip
	unzip master.zip
	mv sdsr-master sdsr
	rm master.zip
	# .Rmd --> .md --> .ipynb
	cd sdsr && \
		jupytext --to notebook \
			 --warn-only \
			 --set-kernel ir \
			 *.Rmd
	# Remove Rmarkdown to lighten folder
	cd sdsr && rm *.Rmd
website:
	Rscript -e "library(markdown); rmarkdown::render('README.md')"
	mv README.html index.html
test:
	for RMD in $$(cd geocompr && ls *.Rmd); \
	do \
            sed -i '1 i ```{r include=FALSE}\nknitr::opts_chunk$$set(eval = FALSE)\n```\n\n' geocompr/$$RMD; \
			cd geocompr && \
					Rscript -e "library(rmarkdown); rmarkdown::render('$$RMD', output_format = 'github_document')" && \
            cd ../ ; \
	done
