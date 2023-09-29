# WASM

WebAssembly Code Examples made with Dev Containers


# WebAssembly
https://www.fermyon.com/wasm-languages/webassembly-language-support

## WASI

## Wasmtime

### Install
```
curl https://wasmtime.dev/install.sh -sSf | bash
```

### Execute module
```
wasmtime --dir . main.wasm
```
## WASMER
### Install
```
curl https://get.wasmer.io -sSfL | sh
```

## WASMEDGE

### Install
```
curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh | bash
```

### Execute it
As you might notice when I fist installed it and try to execute it thows an error
```
➜  wasm+k8s wasmer wasm/c/module/main.wasm            
wasmer: error while loading shared libraries: libtinfo.so.5: cannot open shared object file: No such file or dir$
ctory                                                                                           
```

So I had to google the error click the first result and read a bit.
```
➜  wasm+k8s sudo apt install libtinfo5 
Reading package lists... Done
```

Test all the packages
```
$ wasmer go/target/main.wasm 
Soy un modulo escrito en Go
$ wasmer rust/target/main.wasm 
Soy un modulo escrito en Rust
$ wasmer c/target/main.wasm 
Soy un modulo escrito en C
```

# Docker + WASM

## Setup
https://docs.docker.com/desktop/wasm/#running-a-wasm-application-with-docker-compose

## Build
```
export WASM_LANG=rust #go, c
export BUILDX_NO_DEFAULT_ATTESTATIONS=1 
docker buildx build --platform linux/amd64,wasi/wasm --build-arg WASM_LANG=${WASM_LANG} -t adawolfs/${WASM_LANG}-wasm .
```

## Run
```
docker run  --runtime=io.containerd.wasmedge.v1 --platform=wasi/wasm adawolfs/${WASM_LANG}-wasm 
```

# WASM to OCI

```
wget https://github.com/engineerd/wasm-to-oci/releases/download/v0.1.2/linux-amd64-wasm-to-oci
mv linux-amd64-wasm-to-oci wasm-to-oci
chmod +x wasm-to-oci
sudo cp wasm-to-oci /usr/local/bin
```

```
export CR_PAT=ghp_***********************************
echo $CR_PAT | docker login ghcr.io -u adawolfs --password-stdin
wasm-to-oci push wasm/c/module/main.wasm ghcr.io/adawolfs/wasm-c:latest
```