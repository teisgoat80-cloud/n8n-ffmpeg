FROM n8nio/n8n:latest

USER root

# Check what OS we're on
RUN cat /etc/os-release

# Try Alpine package manager
RUN apk --version || echo "apk not found"

# Try Debian package manager  
RUN apt-get --version || echo "apt-get not found"

# Install FFmpeg based on what's available
RUN if command -v apk > /dev/null; then \
        apk add --no-cache ffmpeg; \
    elif command -v apt-get > /dev/null; then \
        apt-get update && apt-get install -y ffmpeg; \
    fi

USER node
