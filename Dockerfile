# STAGE 1: Build stage
FROM golang:1.24-alpine AS builder

# Set working directory
WORKDIR /app

# Install git and certificates for dependencies
RUN apk add --no-cache git ca-certificates

# Copy go.mod and go.sum for dependency caching
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application code
COPY . .

# 3. Now tidy and download 
RUN go mod tidy
RUN go mod download

# Build the Go binary (using the path discovered in Step 1)
RUN CGO_ENABLED=0 GOOS=linux go build -o muchtodo ./cmd/api/main.go

# STAGE 2: Final Runtime stage
FROM alpine:latest

# Security: Setup a non-root user (Requirement)
RUN adduser -D techuser
USER techuser
WORKDIR /home/techuser/

# Copy the binary from the builder stage
COPY --from=builder /app/muchtodo .

# Copy the .env template (Optional, if app requires it at runtime)
# COPY --from=builder /app/.env.example .env

# Implement health check (Requirement)
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/health || exit 1

EXPOSE 8080

ENTRYPOINT ["./muchtodo"]
