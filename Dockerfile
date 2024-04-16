FROM nextstrain/base


# Install R
RUN apt-get update && apt-get install -y r-base

# Install ggplot2
RUN R -e 'install.packages("ggplot2")'

# Example 3: Add seaborn using pip.
# Allow Snakemake to create subdirs in the user cache dir
# <https://github.com/nextstrain/ncov-ingest/pull/401>
RUN pip3 install seaborn \
 && rm -rf ~/.cache
