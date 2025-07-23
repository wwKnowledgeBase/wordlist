#!/bin/bash

output_file="three_char_alpha_numeric_combinations.wordlist"

letters="abcdefghijklmnopqrstuvwxyz"
numbers="0123456789"

> "$output_file"

echo "Generating all 3-character combinations (two letters, one number)..."

# --- Pattern 1: Number + Letter + Letter (NLL) ---
# Example: 3ah, 5sj
for (( n_idx=0; n_idx<${#numbers}; n_idx++ )); do
  num_char="${numbers:$n_idx:1}"
  for (( l1_idx=0; l1_idx<${#letters}; l1_idx++ )); do
    letter1="${letters:$l1_idx:1}"
    for (( l2_idx=0; l2_idx<${#letters}; l2_idx++ )); do
      letter2="${letters:$l2_idx:1}"
      echo "${num_char}${letter1}${letter2}" >> "$output_file"
    done
  done
done

# --- Pattern 2: Letter + Number + Letter (LNL) ---
# Example: a0h
for (( l1_idx=0; l1_idx<${#letters}; l1_idx++ )); do
  letter1="${letters:$l1_idx:1}"
  for (( n_idx=0; n_idx<${#numbers}; n_idx++ )); do
    num_char="${numbers:$n_idx:1}"
    for (( l2_idx=0; l2_idx<${#letters}; l2_idx++ )); do
      letter2="${letters:$l2_idx:1}"
      echo "${letter1}${num_char}${letter2}" >> "$output_file"
    done
  done
done

# --- Pattern 3: Letter + Letter + Number (LLN) ---
# Example: la7
for (( l1_idx=0; l1_idx<${#letters}; l1_idx++ )); do
  letter1="${letters:$l1_idx:1}"
  for (( l2_idx=0; l2_idx<${#letters}; l2_idx++ )); do
    letter2="${letters:$l2_idx:1}"
    for (( n_idx=0; n_idx<${#numbers}; n_idx++ )); do
      num_char="${numbers:$n_idx:1}"
      echo "${letter1}${letter2}${num_char}" >> "$output_file"
    done
  done
done

# Sort the file and remove any potential duplicates (ensures a clean list)
sort -u -o "$output_file" "$output_file"

echo "Generation complete! All combinations saved to '$output_file'."
echo "Total unique combinations generated: $(wc -l < "$output_file")"
