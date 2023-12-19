# Base image
FROM node:14

# Working directory
WORKDIR /usr/src/app

# Copy application files
COPY . .

# Expose port 8080
EXPOSE 8080

# Start command
CMD [ "node", "server.js" ]
