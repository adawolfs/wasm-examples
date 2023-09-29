# syntax=docker/dockerfile:1
FROM --platform=linux/amd64 alpine AS build
ARG WASM_LANG=go
COPY c/target/main.wasm /c.wasm
COPY go/target/main.wasm /go.wasm
COPY rust/target/main.wasm /rust.wasm
RUN mv /${WASM_LANG}.wasm /main.wasm

FROM --platform=wasi/wasm  scratch
ARG WASM_LANG=go
COPY --from=build /main.wasm /main.wasm
CMD ["/main.wasm"]
