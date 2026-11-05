# IBH-PC Final Project

## Contents

- IBH-PC.Rmd: RMarkdown file containing the report to be rendered, which includes the modularized code sections
- 00_tidy_data.R: executes data cleaning tasks
- 01_make_table1.R: makes a table displaying baseline depression by sex
- 02_make_hist.R: creates a histogram showing the age distribution of participants to offer further demographic information
- 03_make_bar.R: makes a stacked bar plot reporting presence or absence of depression at each data collection point, separated by treatment and control groups
- 04_render_report.R: orders the report to render
- Makefile: contains rules for building the report

## How to Generate Final Report
To generate the final report,
1. open the project in RStudio
2. navigate to the terminal
3. enter a "make clean" command to ensure all output files are deleted,
4. run the "make" command

The final report will be viewable as `IBH-PC.html`

## Report Contents Description
The outputs of the report include two .rds files and two .png files.

.rds: one for the clean data and one for table one

.png: an image of the histogram generated and an image of the stacked bar plot


## Location of Code for Table
The code for table one is located in the 'code' folder and labeled `01_make_table1.R`

To navigate: `code/01_make_table1.R`

## Location of Code for Figures
The code for the histogram of age is located in the 'code' folder and labeled `02_make_hist.R`

To navigate: `code/02_make_hist.R`

The code for the stacked bar plot of depression over time by group is located in the 'code' folder and labeled `03_make_bar.R`

To navigate: `code/03_make_bar.R`

