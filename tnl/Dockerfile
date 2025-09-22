# Python 3.11 Dockerfile
FROM python:3.11-slim

# Install any additional dependencies here
RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --no-cache-dir \
    Flask \
    jupyterlab

CMD ["python3"]