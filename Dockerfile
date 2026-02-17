FROM n8nio/n8n:latest

USER root

# Download static FFmpeg using Docker's ADD
ADD https://github.com/eugeneware/ffmpeg-static/releases/download/b6.0/ffmpeg-linux-x64 /usr/local/bin/ffmpeg

# Make it executable
RUN chmod +x /usr/local/bin/ffmpeg

# Verify installation
RUN /usr/local/bin/ffmpeg -version

USER node
