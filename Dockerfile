# Use a base image
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y nginx

# Create a simple index.html file to verify it's working
RUN echo "<html><body><h1>Hello from Docker container deployed by Jenkins!</h1></body></html>" > /var/www/html/index.html

# Expose port
EXPOSE 80

# Start nginx when container starts
CMD ["nginx", "-g", "daemon off;"]
