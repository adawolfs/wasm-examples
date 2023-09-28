# RUST

## Setup
### Add wasm32-wasi target
```
rustup target add wasm32-wasi
```

## Compile to wasi and prepare module
```
cargo build --target wasm32-wasi && cp target/wasm32-wasi/debug/main.wasm target/main.wasm
```