# WASM

WebAssembly Code Examples made with containers


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
$ wasmer wasm/golang/main.wasm 
Hello from GoLang
$ wasmer wasm/rust/module/target/wasm32-wasi/debug/module.wasm 
Hello from Rust
$ wasmer wasm/c/module/main.wasm 
Hello from C
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