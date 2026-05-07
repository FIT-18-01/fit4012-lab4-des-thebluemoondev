#!/usr/bin/env bash
set -euo pipefail
# Đã hoàn thiện negative test cho wrong key

P="0001001000110100010101100111100010011010101111001101111011110001"
K1="0001001100110100010101110111100110011011101111001101111111110001"
K2="1111111111111111111111111111111111111111111111111111111111111111"

C=$(echo -e "1\n$P\n$K1" | ./des | grep -oE '[01]{64}')
DECRYPTED=$(echo -e "2\n$C\n$K2" | ./des | grep -oE '[01]{64}')

if [[ "$DECRYPTED" != "$P" ]]; then
    echo "[PASS] Wrong key produced different output as expected."
else
    echo "[FAIL] Wrong key still produced correct plaintext!"
    exit 1
fi