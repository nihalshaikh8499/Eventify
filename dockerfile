# Use the official Python image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install system dependencies (PostgreSQL client, build tools)
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the entire project
COPY . /app/

# Collect static files (Whitenoise)
RUN python manage.py collectstatic --noinput

# Expose port 8000
EXPOSE 8000

# Run migrations and start server
CMD ["bash", "-c", "python manage.py migrate && gunicorn EventManager.wsgi:application --bind 0.0.0.0:8000"]
