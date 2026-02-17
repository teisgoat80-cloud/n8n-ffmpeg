FROM n8nio/n8n:latest

USER root

# Download static FFmpeg binary
RUN curl -L https://github.com/eugeneware/ffmpeg-static/releases/download/b6.0/ffmpeg-linux-x64 -o /usr/local/bin/ffmpeg && \
    chmod +x /usr/local/bin/ffmpeg

# Verify installation
RUN /usr/local/bin/ffmpeg -version

USER node
