.PHONY: all
all: descriptive_analysis IBH-PC.html

outputs/data_tidy.rds: code/00_tidy_data.R clean_data/IBHPC_clean.rds
	Rscript code/00_tidy_data.R

outputs/table_one.rds: code/01_make_table1.R outputs/data_tidy.rds
	Rscript code/01_make_table1.R

outputs/histogram.png: code/02_make_hist.R outputs/data_tidy.rds
	Rscript code/02_make_hist.R

outputs/stacked_bar.png: code/03_make_bar.R outputs/data_tidy.rds
	Rscript code/03_make_bar.R

IBH-PC.html: IBH-PC.Rmd code/04_render_report.R code/00_tidy_data.R code/01_make_table1.R code/02_make_hist.R code/03_make_bar.R
	Rscript code/04_render_report.R

.PHONY: descriptive_analysis
descriptive_analysis: outputs/table_one.rds outputs/histogram.png outputs/stacked_bar.png

.PHONY: clean
clean:
	rm -f outputs/*.rds outputs/*.png IBH-PC.html