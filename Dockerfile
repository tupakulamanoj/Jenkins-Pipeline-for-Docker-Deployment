# Use a base image
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y nginx

# Expose port
EXPOSE 80

# Start nginx when container starts
CMD ["nginx", "-g", "daemon off;"]
