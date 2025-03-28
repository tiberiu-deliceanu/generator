FROM ubuntu:latest

# Install Python 3.10, pip, and Git
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3.10-venv \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a virtual environment
RUN python3.10 -m venv /opt/venv

# Activate the virtual environment and install PyYAML
RUN /opt/venv/bin/python -m pip install --no-cache-dir PyYAML

# Add virtual environment to PATH
ENV PATH="/opt/venv/bin:$PATH"

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
