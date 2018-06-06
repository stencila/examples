# Analysing the Chinook Database using SQLite and R

This example uses the [Chinook Database](https://github.com/lerocha/chinook-database "null") which represents a hypothetical a digital media store, including tables for artists, albums, media tracks, invoices and customers.

The [`chinook.source`](/chinook.source) directory includes a Markdown file with the text of the analysis and some code samples. As it is Markdown, you cannot execute these bits of code. However,
you can open this file in Stencila which will allow you to interact with the code.

In order to do that, you need to use [`Stencila converter`](https://github.com/stencila/convert). Once you installed it, run the following command in your terminal:

```bash
stencila-convert.js import chinook.source chinook.dar
```

We already did this step for you, so if you don't want to deal with the conversion step, you can just download the [`examples`](https://github.com/stencila/examples/archive/master.zip) and open `chinook.dar` folder in Stencila.
