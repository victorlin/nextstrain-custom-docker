FROM nextstrain/base

# Use these variables for platform-specific instructions.
ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH


# Example 1: Add nano using APT, since nextstrain/base based on Debian.
RUN apt-get update && apt-get install -y nano


# Example 2: Add yq by downloading the platform-specific binary to /usr/bin.
# https://github.com/mikefarah/yq#install
RUN BINARY="yq_${TARGETOS}_${TARGETARCH}" && wget https://github.com/mikefarah/yq/releases/download/v4.40.5/${BINARY}.tar.gz -O - | \
  tar xz && mv ${BINARY} /usr/bin/yq


# Example 3: Add seaborn using pip.
RUN pip3 install seaborn
