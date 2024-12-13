# Stage 1: Builder
FROM golang:1.19 AS builder

WORKDIR /app

# Copy the source code and dependencies
COPY . .

# Build the application
RUN go build -o myapp

# Stage 2: Final
FROM alpine:latest

WORKDIR /app

# Copy the built application from the builder stage
COPY --from=builder /app/myapp .

# Command to run the application
CMD ["./myapp"]

# Stage 2: Final
FROM alpine:latest

WORKDIR /app

# Copy the built application from the builder stage
COPY --from=builder /app/myapp .

# Command to run the application
CMD ["./myapp"]


