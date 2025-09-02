# Use an LTS base image for stability and security updates
FROM node:18-alpine AS base

# Create and use non-root user for better security
RUN addgroup -S app && adduser -S app -G app
WORKDIR /app

# Install only production dependencies using cached layer
# 1) copy package manifests first to leverage build cache
COPY package*.json ./
RUN npm ci --omit=dev

# 2) copy the rest of the source code
COPY . .

# Document the port the app listens on
EXPOSE 3000

# Drop privileges
USER app

# Run the server
CMD ["node", "server.js"]
