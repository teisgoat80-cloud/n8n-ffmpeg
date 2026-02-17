FROM n8nio/n8n:latest

USER root

# Download static FFmpeg
ADD https://github.com/eugeneware/ffmpeg-static/releases/download/b6.0/ffmpeg-linux-x64 /usr/local/bin/ffmpeg
RUN chmod +x /usr/local/bin/ffmpeg

# Install Python3 and pip (n8n uses Red Hat UBI base)
RUN microdnf install -y python3 python3-pip && microdnf clean all

# Install gTTS
RUN pip3 install gtts

# Verify installations
RUN /usr/local/bin/ffmpeg -version && python3 --version

USER node
