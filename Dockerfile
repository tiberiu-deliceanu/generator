# Use the latest Ubuntu as the base image
FROM ubuntu:latest

# Set non-interactive environment for APT
ENV DEBIAN_FRONTEND=noninteractive

# Install Python 3.10, pip, and Git
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install PyYAML using pip3 (with --break-system-packages option)
RUN pip3 install --no-cache-dir --break-system-packages PyYAML

# Copy feed.py script into /usr/bin
COPY feed.py /usr/bin/feed.py

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint for the container
ENTRYPOINT ["/entrypoint.sh"]
