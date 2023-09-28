# Go

## Setup
Go 1.21 adds a wasi preview target

https://go.dev/blog/wasi


## Build
```
GOOS=wasip1 GOARCH=wasm go build -o target/main.wasm src/main.go
```

## Build for web
```
GOOS=js GOARCH=wasm go build -o static/main.wasm src/main.go
```

### Extras
- https://binx.io/2022/04/22/golang-webassembly/

