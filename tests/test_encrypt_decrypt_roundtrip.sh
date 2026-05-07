#!/usr/bin/env bash
set -euo pipefail

P="1100110011001100110011001100110011001100110011001100110011001100"
K="1010101010101010101010101010101010101010101010101010101010101010"

# Mã hóa
C_OUT=$(echo -e "1\n$P\n$K" | ./des | grep -oE '[01]{64}')
# Giải mã
FINAL=$(echo -e "2\n$C_OUT\n$K" | ./des | grep -oE '[01]{64}')

if [[ "$FINAL" == "$P" ]]; then
    echo "[PASS] Round-trip test passed."
else
    echo "[FAIL] Decryption failed to match plaintext."
    exit 1
fi