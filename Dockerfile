# Base image with Python
FROM python:3.11-slim

# Install system dependencies for Playwright (optional, if you use Playwright)
RUN apt-get update && apt-get install -y \
    wget curl libnss3 libatk-bridge2.0-0 libx11-xcb1 libxcb-dri3-0 libdrm2 libgbm1 libxcomposite1 libxdamage1 libxrandr2 libasound2 libpangocairo-1.0-0 libgtk-3-0 \
    --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install Playwright browsers (if using Playwright)
RUN playwright install --with-deps

# Copy your application code
COPY . /app
WORKDIR /app

# Command to run your API server (adjust for your framework)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
