# Python 3.11 Dockerfile
FROM mcr.microsoft.com/devcontainers/python:3.11

# Install any additional dependencies here
RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

CMD ["python3"]