FROM n8nio/n8n:latest

USER root

# Install FFmpeg (Debian-based)
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to node user
USER node
