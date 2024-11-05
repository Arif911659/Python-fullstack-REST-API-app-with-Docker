# Dockerfile for Flask app with psycopg2-binary
FROM python:3.6

# Install dependencies required for psycopg2-binary
RUN apt-get update && \
    apt-get install -y gcc libpq-dev

# Set the working directory
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the application code
COPY . .

# Expose port 4000
EXPOSE 4000
# Set environment variables (if any) and run the app
CMD ["flask", "run", "--host=0.0.0.0", "--port=4000"]


# #sets the base image to use. In this case we are using the python 3.6 slim buster image
# FROM python:3.6-slim-buster

# #sets the working directory inside the image
# WORKDIR /app

# #copies the requirements.txt file to the working directory
# COPY requirements.txt ./

# #installs the dependencies
# RUN apt-get update && apt-get install -y libpq-dev

# #installs the requirements
# RUN pip install -r requirements.txt

# #copies all the files in the current directory to the working directory
# COPY . .

# #exposes the port 4000
# EXPOSE 4000

# #runs the flask app
# CMD [ "flask", "run", "--host=0.0.0.0", "--port=4000"]