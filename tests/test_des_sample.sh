#!/usr/bin/env bash
set -euo pipefail

# Dữ liệu chuẩn
P="0001001000110100010101100111100010011010101111001101111011110001"
K="0001001100110100010101110111100110011011101111001101111111110001"
EXPECTED="Ciphertext: 0111111010111111010001001001001100100011111110101111101011111000"

# Biên dịch và chạy
g++ -std=c++17 des.cpp -o des
ACTUAL=$(echo -e "1\n$P\n$K" | ./des | tail -n 1)

if [[ "$ACTUAL" == "$EXPECTED" ]]; then
    echo "[PASS] Sample test matches."
else
    echo "[FAIL] Expected $EXPECTED, got $ACTUAL"
    exit 1
fi