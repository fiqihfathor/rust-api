FROM rust:1.97-slim as builder

WORKDIR /app
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim

WORKDIR /app

COPY --from=builder /app/target/release/rust-api /app/server

EXPOSE 8080
CMD ["/app/server"]
