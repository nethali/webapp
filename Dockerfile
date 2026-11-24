# Use the official Node.js 24 image based
FROM node:24-alpine

# Attach metadata labels to identify the author, description, and release version
LABEL author="Nethali Zoysa"
LABEL description="Simple Web App in Node.js"
LABEL version="1.0.0"

# Set /app as the working directory inside the container for all subsequent instructions
WORKDIR /app

# Copy package manifests (package.json and package-lock.json if present) first so Docker
# can reuse the cached dependency layer when only application source files change
COPY package*.json ./

# Perform a clean install of production-only dependencies (excluding devDependencies)
# using the exact versions locked in package-lock.json
RUN npm ci --omit=dev

# Copy the remaining application source code (respecting .dockerignore) into /app
# with ownership set to the built-in non-root node user and group
COPY --chown=node:node . .

# Switch from root to the non-root node user for better container security at runtime
USER node

# Document that the Express application inside the container listens on port 8080
EXPOSE 8080

# Launch the Node.js web server when the container starts
CMD ["node", "app.js"]