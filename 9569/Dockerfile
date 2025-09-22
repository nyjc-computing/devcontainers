# Python 3.7 Dockerfile
FROM python:3.7-bullseye

# Add MongoDB official repository
RUN apt-get update && apt-get install -y gnupg curl && \
    curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | gpg --dearmor -o /usr/share/keyrings/mongodb-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/mongodb-archive-keyring.gpg] https://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" > /etc/apt/sources.list.d/mongodb-org-4.4.list && \
    apt-get update

# Install MongoDB 4.4
RUN apt-get install -y \
    mongodb-org=4.4.24 \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --no-cache-dir \
    Flask==2.2.5 \
    pymongo==3.13.0 \
    notebook==6.5.6

CMD ["python3"]