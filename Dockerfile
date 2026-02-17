FROM n8nio/n8n:latest

USER root

# Download static FFmpeg
ADD https://github.com/eugeneware/ffmpeg-static/releases/download/b6.0/ffmpeg-linux-x64 /usr/local/bin/ffmpeg
RUN chmod +x /usr/local/bin/ffmpeg

# Download Python standalone build
ADD https://github.com/indygreg/python-build-standalone/releases/download/20231002/cpython-3.11.6+20231002-x86_64-unknown-linux-gnu-install_only.tar.gz /tmp/python.tar.gz

# Extract Python
RUN mkdir -p /opt/python && \
    tar -xzf /tmp/python.tar.gz -C /opt/python --strip-components=1 && \
    rm /tmp/python.tar.gz

# Add Python to PATH
ENV PATH="/opt/python/bin:${PATH}"

# Install gTTS
RUN /opt/python/bin/pip3 install gtts

# Verify installations
RUN /usr/local/bin/ffmpeg -version && /opt/python/bin/python3 --version

USER node
