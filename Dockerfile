# Use Node.js as the base image
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Install required dependencies (optional)
RUN apk add --no-cache expect

# Automatically run the interactive Medusa app creation
RUN npx create-medusa-app@latest store --db-url "postgres://medusa:medusa@89.168.51.250:5432/medusa"

# Set working directory to the newly created Medusa app
WORKDIR /app/store

# Install dependencies
#RUN npm install

# Expose Medusa's default port
EXPOSE 9000
EXPOSE 7000

# Start the Medusa server
CMD ["npm", "start"]
