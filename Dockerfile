# Dockerfile for running eLife 30274 example on Binder
# See https://mybinder.readthedocs.io/en/latest/tutorials/dockerfile.html

# Base image with Stencila R and other package installed
FROM stencila/examples-elife-30274@sha256:fa2b5e4260426d495761983f51b95791f5f4a70f2a2a8903b00bc3d075221172

# Install Python and Node to be able to run Jupyter and nbstencilaproxy
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
 && apt-get update \
 && apt-get install -y \
      python3 \
      python3-pip \
      nodejs \
 && apt-get autoremove -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install and enable nbstencilaproxy
RUN pip3 install --no-cache-dir \
      https://github.com/nokome/nbstencilaproxy/archive/master.tar.gz \
 && jupyter serverextension enable --sys-prefix --py nbstencilaproxy

# Add a non-root user
ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

# Register the Stencila package as that user so that R 
# execution contexts are available
RUN R -e 'stencila::register()'

# Turn of authentication by Stencila (to be handled by Jupyter)
ENV STENCILA_AUTH false

# Run the Jupyter notebok server
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]
