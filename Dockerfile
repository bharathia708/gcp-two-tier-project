# Use Ubuntu as the base image
FROM ubuntu:20.04

# Update the package lists and install necessary dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the application code to the container
COPY . .

# Expose the port on which the application will run
EXPOSE 8000

# Define the command to run the application
CMD ["python3", "app.py"]
