# # Use an official Python 3.10 image from Docker Hub
# FROM python:3.10-slim-buster

# # Set the working directory
# WORKDIR /app

# # Copy your application code
# COPY . /app

# # Install the dependencies
# RUN pip install -r requirements.txt

# # Expose the port FastAPI will run on
# EXPOSE 5000

# # Command to run the FastAPI app
# CMD ["python3", "app.py"]


# Use Python base image
FROM python:3.10-slim-buster

# Set working directory
WORKDIR /app

# Copy project
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 5000


# Run FastAPI with uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "5000"]