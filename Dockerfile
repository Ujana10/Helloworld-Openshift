# Build stage
FROM gcc:latest as builder
WORKDIR /app
COPY helloworld.c .
RUN gcc helloworld.c -o helloworld

# Runtime stage
FROM registry.access.redhat.com/ubi9/ubi-minimal
WORKDIR /app
COPY --from=builder /app/helloworld .
CMD ["./helloworld"]