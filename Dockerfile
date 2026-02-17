FROM n8nio/n8n:latest

USER root

# Install FFmpeg
RUN apk add --no-cache ffmpeg

# Switch back to node user
USER node
