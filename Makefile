BUILD_ENV := rust

.PHONY: build-wasm build-did

# cargo install twiggy
twiggy:
	twiggy top -n 12 target/wasm32-unknown-unknown/release/ic_bitcoin_can_backend.wasm

# cargo install ic-wasm
build-wasm:
	cargo build --release --target wasm32-unknown-unknown --package ic_bitcoin_can_backend
	ic-wasm -o target/wasm32-unknown-unknown/release/ic_bitcoin_can_backend_optimized.wasm target/wasm32-unknown-unknown/release/ic_bitcoin_can_backend.wasm shrink

# cargo install candid-extractor
build-did:
	candid-extractor target/wasm32-unknown-unknown/release/ic_bitcoin_can_backend.wasm > src/ic_bitcoin_can_backend/ic_bitcoin_can_backend.did
