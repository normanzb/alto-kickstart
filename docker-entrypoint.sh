#!/usr/bin/env bash
set -euo pipefail

# Allow overrides from the environment, otherwise use provided defaults.
ALTO_ENTRYPOINTS="${ALTO_ENTRYPOINTS:-0x5ff137d4b0fdcd49dca30c7cf57e578a026d2789}"
ALTO_EXECUTOR_PRIVATE_KEY="${ALTO_EXECUTOR_PRIVATE_KEY:-0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80}"
ALTO_UTILITY_PRIVATE_KEY="${ALTO_UTILITY_PRIVATE_KEY:-0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80}"
ALTO_MIN_BALANCE="${ALTO_MIN_BALANCE:-0}"
ALTO_RPC_URL="${ALTO_RPC_URL:-https://...}"
ALTO_NETWORK_NAME="${ALTO_NETWORK_NAME:-anvil}"

exec ./alto \
  --entrypoints "${ALTO_ENTRYPOINTS}" \
  --executor-private-keys "${ALTO_EXECUTOR_PRIVATE_KEY}" \
  --utility-private-key "${ALTO_UTILITY_PRIVATE_KEY}" \
  --min-balance "${ALTO_MIN_BALANCE}" \
  --rpc-url "${ALTO_RPC_URL}" \
  --network-name "${ALTO_NETWORK_NAME}"
