# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the requirements file into the container at /usr/src/app
COPY requirements.txt ./

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application's code into the container at /usr/src/app
COPY . .

# Make port 80 available to the world outside this container
EXPOSE 80

# Define the directory where the FAISS index will be stored (as a volume)
VOLUME ["/usr/src/app/data"]

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
