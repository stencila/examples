## InterMine webservice tutorials

### Introduction

[InterMine](http://intermine.org/) is open-source software which integrates biological data sources, making it easy to query and analyse data. There are many different InterMines worldwide, covering a broad range of model organisms and life science research areas.

The [intermine/intermine-ws-python-docs](https://github.com/intermine/intermine-ws-python-docs) repo has several Jupyter notebook tutorials tutorials to help researcher get familiarised with the `intermine-python` package.

This example converts the tutorial notebooks into a single [Dar](https://github.com/substance/dar) document archive which can be opened and executed in Stencila Desktop.

[](screenshot-first-tutorial.png)

### Approach

This is a **very preliminary** version of this example!

To convert the `.ipynb` files into the XML files in `tutorials.dar` we used the [`stencila/convert`](https://github.com/stencila/convert) toolset (you don't need to do that, the XML files are committed into this repo:

```bash
stencila-convert import tutorials tutorials.dar
```

To open and run the `tutorials.dar` folder you will need an `ipython` kernel installed on your system. In addition, this example relies on some very recent branches of various Stencila components which have not yet been integrated into Stencila Desktop:

- https://github.com/stencila/stencila/pull/682
- https://github.com/stencila/node/pull/42

We don't recommend trying to build Stencila Desktop with these, unless you are already comfortable building it and using `npm link` to apply in these branches. We hope to get them merged and release a binary with them in the coming weeks.

### Next steps

- Add all the Intermine `*-tutorial.ipynb` files into `tutorials`

- Decide how to approach console outputs i.e. `print` statements. Currently, `stdout` display data is not being captured from Jupyter kernels. e.g. there is not `output` from this cell

[](screenshot-print.png)

This is intentional, Stencila takes a more "function-like" approach to code cells. For compatability with Jupyter notebooks using `print`, one option (the simplest, and probably the most consistent, is to return the `stdout` output as a plain string data value). The other option (which will require more work, for this example, and generally) would be to rewrite the tutorial code cells.

- Create a Docker image so that you can open this example using Binder
