# Python 3.7 Dockerfile
FROM python:3.7-slim

# Install any additional dependencies here
RUN apt-get update && apt-get install -y \
    mongodb-server=3.4.9 \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --no-cache-dir \
    Flask==2.2.5 \
    pymongo==3.13.0 \
    notebook==6.5.6

CMD ["python3"]