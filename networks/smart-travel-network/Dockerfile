FROM ghcr.io/openagents-org/openagents:latest

WORKDIR /app

ENV PYTHONUNBUFFERED=1

# Install system dependencies (git/curl are usually needed)
RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

# Copy project files (we don't need pip install as openagents is in the base image)
COPY . .

# Make startup script executable
COPY start_zeabur.sh .
RUN chmod +x start_zeabur.sh

# Expose the dashboard port
EXPOSE 8700

# Start the monolith
CMD ["./start_zeabur.sh"]
