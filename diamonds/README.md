# Anaylsing Diamonds dataset with SQL and R

This example uses [diamonds data set](http://ggplot2.tidyverse.org/reference/diamonds.html) which contains the prices, carat, colour and other attributes of almost 54,000 diamonds. This data set is also available for downlad as a plain [csv file](https://github.com/stencila/examples/blob/master/diamonds/data.csv) (note that this is a large
  file with over 5000 records totaling up to more than 13 MB).

The example illustrates the following Stencila features:

- using multiple languages within a single document;
- passing data between languages;
- using an output to display a variable;
- using a inputs to create an interactive document.


The [`diamonds.source`](https://github.com/stencila/examples/tree/master/diamonds/diamonds.source) directory includes a Markdown file with the text of the analysis and some code samples. As it is Markdown, you cannot execute these bits of code. However,
you can open this file in Stencila which will allow you to interact with the code.

Currently Stencila Desktop allows you to directly open only Dar (Reproducible Document Archive) format. You can use [`Stencila converter`](https://github.com/stencila/convert)
in order to convert files from other popular formats (`md`, `Rmd`, `ipynb`, `tex`, `odt`, `html`, `docx`) into `dar`.

We already did this step for you, so if you don't want to deal with the conversion step, you can just download the [`examples`](https://github.com/stencila/examples/archive/master.zip) and open `diamonds.dar` folder in Stencila Desktop.
