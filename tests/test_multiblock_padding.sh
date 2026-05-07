#!/usr/bin/env bash
set -euo pipefail

# 80 bit plaintext
P="11111111111111111111111111111111111111111111111111111111111111110000000000000000"
K="1100110011001100110011001100110011001100110011001100110011001100"

OUT=$(echo -e "1\n$P\n$K" | ./des | grep -oE '[01]+')

if [[ ${#OUT} -eq 128 ]]; then
    echo "[PASS] Padding and Multi-block success (Length: ${#OUT})."
else
    echo "[FAIL] Expected 128 bits output, got ${#OUT}."
    exit 1
fi