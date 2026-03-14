# Build stage
FROM docker.io/oven/bun:alpine AS builder

# Install Hugo and Bash (for build.sh)
RUN apk add --no-cache hugo bash

WORKDIR /src
COPY . .

# Build the site
RUN chmod +x scripts/build.sh && ./scripts/build.sh

# Final stage
FROM docker.io/nginx:stable-alpine-slim

# Copy built site from builder stage
COPY --from=builder /src/public /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
