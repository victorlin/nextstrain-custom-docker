FROM nextstrain/base


# Example 1: Add nano using APT, since nextstrain/base based on Debian.
RUN apt-get update && apt-get install -y nano


# Example 2: Add yq by downloading the platform-specific binary to /usr/bin.
# yq's release page provides binaries for both linux/amd64 and linux/arm64.
# https://github.com/mikefarah/yq#install
ARG TARGETOS
ARG TARGETARCH
RUN BINARY="yq_${TARGETOS}_${TARGETARCH}" && wget https://github.com/mikefarah/yq/releases/download/v4.40.5/${BINARY}.tar.gz -O - | \
  tar xz && mv ${BINARY} /usr/bin/yq


# Example 3: Add seaborn using pip.
# Allow Snakemake to create subdirs in the user cache dir
# <https://github.com/nextstrain/ncov-ingest/pull/401>
RUN pip3 install seaborn \
 && rm -rf ~/.cache
