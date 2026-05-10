# Stage 1: Build stage
FROM node:18-alpine AS builder
WORKDIR /app
# Copy package files and install production dependencies
COPY package*.json ./
RUN npm ci --only-production
# Copy the rest of the application source code
COPY . .

# Stage 2: Production stage (smaller final image)
FROM node:18-alpine
WORKDIR /app
# Copy only the necessary files from the builder stage
COPY --from=builder /app .
# Expose the port the app runs on (matching your server's config)
EXPOSE 5000
# Start the application
CMD ["node", "index.js"]