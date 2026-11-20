FROM node:24-alpine

LABEL author="Nethali Zoysa"
LABEL description="Simple Web App in Node.js"
LABEL version="1.0.0"

WORKDIR /app

# Install dependencies first to leverage Docker layer caching
COPY package*.json ./
RUN npm ci --omit=dev

# Copy application source code
COPY --chown=node:node . .

# Run as non-root user
USER node

EXPOSE 8080

CMD ["node", "app.js"]