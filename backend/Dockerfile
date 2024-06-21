# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Install PostgreSQL client tools
RUN apt-get update && apt-get install -y postgresql-client

# Copy the requirements file to the container
COPY requirements.txt /app/

# Install dependencies
RUN pip install -r requirements.txt

# Verify the installation of dependencies
RUN pip list

# Copy the wait-for-postgres script
COPY wait-for-postgres.sh /app/

# Set the execute permissions for the script
RUN chmod +x /app/wait-for-postgres.sh

# Copy the current directory contents into the container at /app
COPY . /app/

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run manage.py commands to set up the application
CMD ["./wait-for-postgres.sh", "db", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
