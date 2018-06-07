# Data analysis in Stencila Sheets using R


This example illustrates the use of R code within Stencila Sheets. It demonstrates how you can enable a spreadsheet user/collaborator to deploy the functions available in R.
The example is based on the introductory course to R from Software and Data Carpentry, and uses standard built-in R functions.

The `r-sheet.csv` example includes cells that start with `"r=...` include R functions (for example, `“r= hist(B2:AO2)”` ) which in a standard spreadsheet application will not work. However, in Stencila Sheets this code can be fully interactive when the relevant execution context is enabled.

 At the same time, you can still edit cells with data, add more R functions and then save the file in `csv` format (which then you can send back to the collaborator who prefers to use a spreadsheet application).

The [`r-sheet.source`](https://github.com/stencila/examples/tree/master/r-spreadsheet/r-sheet.source) directory includes two csv file with the data for the analysis and some code samples. There is also a Markdown file with some analysis text.

Currently Stencila Desktop allows you to directly open only Dar (Reproducible Document Archive) format. You can use [`Stencila converter`](https://github.com/stencila/convert)
in order to convert files from other popular formats (`csv`, `xls`, `xlsx`) into `dar`.

We already did this step for you, so if you don't want to deal with the conversion step, you can just download the [`examples`](https://github.com/stencila/examples/archive/master.zip) and open `r-sheet.dar` folder in Stencila Desktop.
