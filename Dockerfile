# Use the official Node.js 24 base image
FROM node:24-alpine

# Attach metadata labels
LABEL author="Nethali Zoysa"
LABEL description="Simple Web App in Node.js"
LABEL version="1.0.0"

# Set /app as the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Perform a clean install
RUN npm ci --omit=dev

# Copy the rest of the project files
COPY --chown=node:node . .

# Switch from root to the non-root user
USER node

# Container listens on port 8080
EXPOSE 8080

# Start the Express web application
CMD ["node", "app.js"]