#!/usr/bin/env bash
set -euo pipefail
# Đã hoàn thiện negative test cho tamper dữ liệu

P="0001001000110100010101100111100010011010101111001101111011110001"
K="0001001100110100010101110111100110011011101111001101111111110001"

C=$(echo -e "1\n$P\n$K" | ./des | grep -oE '[01]{64}')
# Thay đổi 1 bit cuối của Ciphertext để giả lập bị tấn công (tamper)
TAMPERED_C="${C%?}0"

DECRYPTED=$(echo -e "2\n$TAMPERED_C\n$K" | ./des | grep -oE '[01]{64}')

if [[ "$DECRYPTED" != "$P" ]]; then
    echo "[PASS] Tampered ciphertext produced garbage data as expected."
else
    echo "[FAIL] Tampered ciphertext still decrypted correctly!"
    exit 1
fi