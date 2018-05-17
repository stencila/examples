## Replicating a replication study


### Introduction

This example replicates the paper:

> Lewis, L. Michelle, et al. "Replication Study: Transcriptional amplification in tumor cells with elevated c-Myc." eLife 2018;7:e30274 DOI: 10.7554/eLife.30274

This study was a replication attempt of Lin et al, 2012 (Cell) #48. The article is available on the eLife website https://elifesciences.org/articles/30274 and there is an Open Science Framework folder containing code and data https://osf.io/mokeb/.

This is a **work in progress**

![](screenshot-1.png)


### Approach

Lewis et al used reproducible research methods to do this replication study including making their source RMarkdown file available. Given that, the approach taken here was to translate their RMarkdown file into a form which could be converted into a Dar with minimal subsequent editing required. This is a test of:

- the ability of our RMarkdown converter to create valid, semantic JATS

- the ability of our execution engine and R execution context to handle the R code used


### Steps

- Downloaded `Replication_Study_48.Rmd` from https://osf.io/vdrsh/download

- Deleted the YAML header which included `knitr` and `pandoc` processing instructions e.g. `fontsize: 12pt`

- Extracted the preliminary code chunks which download files to `setup.R` and then ran it using `Rscript setup.R` which downloaded several files and did setup data manipulation. 

- Converted meta data from formatted text to structured YAML front matter

- Converted the `Rmd` file to JATS


## Next steps

- complete translating meta data to YAML front matter

- put reproducible tables and figures inline (currently at end of document)

