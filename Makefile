all: image extract convert
	
image:
	# Build the Docker image
	cd article && docker build --tag stencila/examples-elife-30274 .

extract:
	# Extract CSV files less than 100k from the image
	cd article && docker run --rm stencila/examples-elife-30274 bash -c 'find . -maxdepth 1 -name "*.csv" -size -100k | tar -c -T -' | tar x

extract-all:
	# Extract everthing
	docker run --rm stencila/examples-elife-30274 bash -c 'find . ! -name ".checkpoint" | tar -c -T -' > all.tar.gz

convert:
	# Convert the article (including R Markdown and CSV files) to a DAR
	stencila convert article article.dar

binder-branch:
	git checkout elife-30274-binder && \
	git checkout master -- elife-30274 && \
	git mv elife-30274/* . && \
	git commit -m 'Update the Binder deployment branch'
