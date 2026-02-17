# Start from Debian with package manager
FROM debian:bullseye-slim AS builder

# Install FFmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Now layer n8n on top
FROM n8nio/n8n:latest

USER root

# Copy FFmpeg from builder stage
COPY --from=builder /usr/bin/ffmpeg /usr/bin/ffmpeg
COPY --from=builder /usr/lib/*-linux-gnu/libav*.so* /usr/lib/
COPY --from=builder /usr/lib/*-linux-gnu/libsw*.so* /usr/lib/
COPY --from=builder /usr/lib/*-linux-gnu/libpostproc*.so* /usr/lib/
COPY --from=builder /usr/lib/*-linux-gnu/libx264*.so* /usr/lib/
COPY --from=builder /usr/lib/*-linux-gnu/libx265*.so* /usr/lib/

USER node
