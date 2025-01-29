# ---- Stage 1: Build ----
FROM node:22-alpine AS builder

WORKDIR /usr/src/app

# Install pnpm globally
RUN npm i -g pnpm

# Copy package files and install all dependencies (including dev dependencies)
COPY package*.json ./
COPY pnpm-lock.yaml ./
RUN pnpm install

# Copy the entire project (excluding unnecessary files via .dockerignore)
COPY . .

# Compile TypeScript to JavaScript
RUN pnpm build

# ---- Stage 2: Production ----
FROM node:22-alpine

WORKDIR /usr/src/app

# Install pnpm globally (needed to run the app)
RUN npm i -g pnpm

# Copy package files
COPY package*.json ./
COPY pnpm-lock.yaml ./

# Install only production dependencies
RUN pnpm install --prod

# Copy compiled files from builder stage
COPY --from=builder /usr/src/app/dist ./dist

# Copy node_modules from builder stage
COPY --from=builder /usr/src/app/node_modules ./node_modules

# Set environment variables
ENV NODE_ENV=production

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["node", "dist/index.js"]
