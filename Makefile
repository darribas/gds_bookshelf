shelf: gds_pysal geocompr
gds_pysal:
	# Clean pre
	rm -rf gds_pysal
	# Pull down
	wget https://github.com/gdsbook/book/archive/master.zip
	unzip master.zip
	mv book-master gds_pysal
	rm master.zip
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
	#for RMD in (cd geocompr && ls *.Rmd); \
	#do \
	#		cd geocompr && \
	#				Rscript -e "library(rmarkdown); rmarkdown::render('$(RMD)', output_format = 'md_document')"; \
	#						 $(RMD); \
	#done
	# Remove Rmarkdown to lighten folder
	cd geocompr && rm *.Rmd
website:
	Rscript -e "library(markdown); rmarkdown::render('README.md')"
	mv README.html index.html
