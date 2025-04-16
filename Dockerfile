# Use an official lightweight Node.js image
FROM node:18-alpine

# Install pnpm
RUN corepack enable && corepack prepare pnpm@9.15.9 --activate

# Set the working directory in the container
WORKDIR /app

# Copy package files and install dependencies
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# Copy the rest of the application code
COPY . .

# Build the Next.js application
RUN pnpm run build

# Expose the port your app runs on
EXPOSE 5001

# Start the application in production mode
CMD ["pnpm", "dev"]
