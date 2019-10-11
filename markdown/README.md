---
title: Writing structured articles with Markdown and Stencila 
authors:
  - Nokome Bentley
  - Alex Ketch
  - Ben Shaw
description: |
    This article provides a guide to how to write, and collaborate on, a reproducible research article using Markdown and Stencila. As well as describing the basics of embedding code in your article, it covers how to include meta-data (such as author names and affiliations), citations and references. Finally, we discuss how you can preview your article and convert it to other formats using Stencila. 
---

## Preface

This is part of a series of "self-documenting" example articles, each written in a particular format, describing how to author structured, reproducible articles in that format. 

The canonical source for this article is [this](https://hackmd.io/RaFYCFoyTlODFxz5hPevLw) Markdown document on HackMD. The content is also synced to [this file](https://github.com/stencila/examples/tree/master/markdown) on Github. If you are not already, you can open this Markdown document on Stencila using this button:

[![](https://img.shields.io/badge/open%20on-stencila-brightgreen)](https://hub.stenci.la/open/https://hackmd.io/RaFYCFoyTlODFxz5hPevLw)


Other articles in this series for other formats / sites:

- [RMarkdown](https://hub.stenci.la/open/https://github.com/stencila/examples/tree/master/rmarkdown/rmarkdown.Rmd)
- [Jupyter Notebooks](https://hub.stenci.la/open/https://github.com/stencila/examples/tree/master/jupyter/jupyter.ipynb)
- [Google Docs](https://hub.stenci.la/open/https://docs.google.com/document/d/1BW6MubIyDirCGW9Wq-tSqCma8pioxBI6VpeLyXn5mZA)
- [HackMD](https://hub.stenci.la/open/https://hackmd.io/RaFYCFoyTlODFxz5hPevLw)

_Please note that this example is a work in progress._

## CommonMark

Stencila uses a superset of [CommonMark parser](https://spec.commonmark.org/current/), as such most—if not all—valid CommonMark files should work within the Stencila ecosystem.

## Frontmatter

To capture metadata about the document, such as authors, publication details, and citations, you can use add them as YAML to the document frontmatter.

[See the markdown source]((https://hackmd.io/RaFYCFoyTlODFxz5hPevLw)) of this document for an example.

As markdown files are interpreted as Article nodes, you may include any valid Article schema attributes, which can be [seen here](https://github.com/stencila/schema/blob/master/schema/Article.md).

## Code

At the heart of reproducible data-driven documents are code elements, allowing readers to experiment with and validate data. It is in this area where Stencila's Markdown schema differs most from regular Markdown.

Whilst there has always been support for inline code elements, and code blocks, traditional markdown formats only included the source code, but did not easily allow for executing the code and capturing the resulting artifacts.

The inclusion of outputs along with the code allow for readers to read manuscripts on the go, work without having to manage project environments and dependencies, and even commit files to Git to take advantage of commit diffs and history.

### CodeBlocks

Native markdown code blocks are written by surrounding the source code with three backticks, also known as grave accent.

````
```js
// this is my javascript code
const n = 6 * 7
return n
```
````

To convert the above code blcok into a Stencila CodeChunk, we have to wrap it in a directive as seen below.

````
chunk:
:::
```js
const n = 6 * 7
return n
```

!number(42)
:::
````

The above will get rendered as:

chunk:
:::
```js
const n = 6 * 7
return n
```

!number(42)
:::

There are a number of differences to go over compared to plain code blocks.

We open the CodeChunk block with the name of the directive, and three consecutive colons.

```md
chunk: # ← Directive name
:::    # ← Start directive block
```js  # ← Start code, indicating programming langugage
const n = 6 * 7
return n
```    # ← End code

!number(42)  # ← Output, see Extensions section for information about `!number()`
:::    # ← End directive block
```

CodeBlocks can have multiple outputs, and are not limited to string values.

### CodeExpression

CodeExpressions are inline variants of CodeChunks, allowing you to include computed values within paragraphs and other inline elements.

An example of a CodeExpression follows, where we want to include the answer, `return 6 * 7`{type=expr lang=js output=[42]}, to life and everything else.

Unlike `CodeChunk`s, `CodeExpression`s can only have a single resulting output.

## Extensions

A number of extra content types can be expressed using special syntax. These are often useful for capturing results of executing code.

- The [Null primitive](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/null) value: `!null`
- Numeric values: `!number(42)`
- Boolean values: `!true` and `!false`
- Arrays of values: `!array(1, 2, 3)`
- Objects, comma separated pairs of any JSON primitives: `!object("key":value, "anotherKey": value, …)`
- Inline Quotes: `!quote[Quoted Content]`

## Text

### Headings

Stencila supports markdown heading levels 1 through 6, rendering them as Heading nodes.
The sections headings of this document are examples of how the headings will be rendered.

### Inline Text Markup

Stencila will interpret the following inline text markup:

*Italic* text as a Emphasis node

*Bold text* as a Strong emphasis node

Text with a ~~strikethrough~~ as a Delete node

Text surrounded with back-ticks, commonly used for `code examples`, as a Code node

^Superscript^ text, that is text surrounded with ^-s, as a Superscript node

### Footnotes & References

Footnotes and referneces are currently not supported. Please follow [this issue](https://github.com/stencila/encoda/issues/144) for updates.

## Lists

Stencila recognises lists in Markdown including unordered (bulleted) lists like this:

- Apple
- Pear
- Peach

And ordered lists like this:

1. Butter
2. Cheese
3. Milk

Nested lists are supported too:

1. Fruit
	1. Apple
	2. Pear
	3. Peach
2. Dairy
	1. Butter
	2. Cheese
    3. Milk

## Tables

| Planet  | Avg. Distance from the Sun | Radius      | Mass                |
| :------ | :------------------------- | :---------- | :------------------ |
| Mercury | 58,000,000 km              | 4,880 km    | 3.3011 × 10^23^ kg  |
| Venus   | 108,000,000 km             | 12,103.6 km | 4.8675 × 10^24^ kg  |
| Earth   | 119,600,000 km             | 6,371.0 km  | 5.97237 × 10^24^ kg |
| Mars    | 230,000,000 km             | 3389.5 km   | 6.4171 × 10^23^ kg  |


## Images

Images and other figures can play a vital role in helping readers gain understanding of new and complex subject matter.

When converting between file formats, Stencila will attempt to embed the image in the target document format if possible, otherwise it will output media assets next to the converted file in a directory suffixed with “.media”. For example, converting this document to HTML will result with a folder called “my-document.media”.

As Markdown does not natively support embedding images, any referenced images must either be publicly hosted online, or included as relative file-paths which will get collected inside the media folder mentioned in the preceding paragraph.

![Photo by Joel Filipe on Unsplash https://unsplash.com/photos/pfX-GsJMtDY](https://i.imgur.com/rtXAGoG.jpg)


## HTML

There times when including HTML content inside Markdown is necessary, usually to express complex elements or add stylistic attributes.

Stencila is able to interpret the HTML using its HTML Codec, however note that stylistic attributes such as colors and dimensions will be discarded.

Another point to keep in mind is that Markdown nested inside HTML tags will not be transformed. The following example will not work:

```md
# My document

<div style="color: red">

<p>List of Fruits:</p>

1. Apple
2. Pear
3. Peach

</div>
```

In the example above, the markdown syntax used to list fruit, will not be transformed into a list.