# Alto Railway Docker Image

Dockerfile to build and run Pimlico's Alto bundler on Railway. It clones the upstream repo, pulls submodules, installs dependencies with pnpm, builds, and starts the bundler with environment-driven config.

## Build locally

```sh
docker build -t alto-railway .
docker run --rm \
  -e ALTO_ENTRYPOINTS="0x5ff137d4b0fdcd49dca30c7cf57e578a026d2789" \
  -e ALTO_EXECUTOR_PRIVATE_KEYS="0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80" \
  -e ALTO_UTILITY_PRIVATE_KEY="0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80" \
  -e ALTO_MIN_BALANCE="0" \
  -e ALTO_RPC_URL="https://..." \
  -e ALTO_NETWORK_NAME="anvil" \
  alto-railway
```

## Railway variables

Set these in the Railway dashboard (they have sane defaults in the image):

- `ALTO_ENTRYPOINTS`
- `ALTO_EXECUTOR_PRIVATE_KEYS`
- `ALTO_UTILITY_PRIVATE_KEY`
- `ALTO_MIN_BALANCE`
- `ALTO_RPC_URL`
- `ALTO_NETWORK_NAME`

## Runtime command

`docker-entrypoint.sh` runs:

```
./alto --entrypoints "$ALTO_ENTRYPOINTS" --executor-private-keys "$ALTO_EXECUTOR_PRIVATE_KEYS" --utility-private-key "$ALTO_UTILITY_PRIVATE_KEY" --min-balance "$ALTO_MIN_BALANCE" --rpc-url "$ALTO_RPC_URL" --network-name "$ALTO_NETWORK_NAME"
```
