all: image extract convert
	
image:
	# Build the Docker image
	cd article && docker build --tag stencila/examples-elife-30274 .

extract:
	# Extract CSV files less than 100k from the images
	cd article && docker run --rm stencila/examples-elife-30274 bash -c 'find . -name "*.csv" -size -100k | tar -c -T -' | tar x

convert:
	# Convert the article (including R Markdown and CSV files) to a DAR
	stencila convert article article.dar

