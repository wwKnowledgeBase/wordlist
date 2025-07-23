#!/bin/bash

output_file="three_char_capital_lower_number_combinations.wordlist"

capital_letters="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
lowercase_letters="abcdefghijklmnopqrstuvwxyz"
numbers="0123456789"

> "$output_file"

echo "Generating all 3-character combinations (one capital, one lowercase, one number)..."

# --- Pattern variations for C (Capital), L (Lowercase), N (Number) ---

# 1. Capital at position 1: CLN, CNL
for (( c_idx=0; c_idx<${#capital_letters}; c_idx++ )); do
  char_cap="${capital_letters:$c_idx:1}"
  for (( l_idx=0; l_idx<${#lowercase_letters}; l_idx++ )); do
    char_lower="${lowercase_letters:$l_idx:1}"
    for (( n_idx=0; n_idx<${#numbers}; n_idx++ )); do
      char_num="${numbers:$n_idx:1}"
      echo "${char_cap}${char_lower}${char_num}" >> "$output_file" # CLN
      echo "${char_cap}${char_num}${char_lower}" >> "$output_file" # CNL
    done
  done
done

# 2. Capital at position 2: LCN, NCL
for (( l_idx=0; l_idx<${#lowercase_letters}; l_idx++ )); do
  char_lower="${lowercase_letters:$l_idx:1}"
  for (( c_idx=0; c_idx<${#capital_letters}; c_idx++ )); do
    char_cap="${capital_letters:$c_idx:1}"
    for (( n_idx=0; n_idx<${#numbers}; n_idx++ )); do
      char_num="${numbers:$n_idx:1}"
      echo "${char_lower}${char_cap}${char_num}" >> "$output_file" # LCN
      echo "${char_num}${char_cap}${char_lower}" >> "$output_file" # NCL
    done
  done
done

# 3. Capital at position 3: LNC, NLC
for (( l_idx=0; l_idx<${#lowercase_letters}; l_idx++ )); do
  char_lower="${lowercase_letters:$l_idx:1}"
  for (( n_idx=0; n_idx<${#numbers}; n_idx++ )); do
    char_num="${numbers:$n_idx:1}"
    for (( c_idx=0; c_idx<${#capital_letters}; c_idx++ )); do
      char_cap="${capital_letters:$c_idx:1}"
      echo "${char_lower}${char_num}${char_cap}" >> "$output_file" # LNC
      echo "${char_num}${char_lower}${char_cap}" >> "$output_file" # NLC
    done
  done
done

# Sort the file and remove any potential duplicates (ensures a clean list)
sort -u -o "$output_file" "$output_file"

echo "Generation complete! All combinations saved to '$output_file'."
echo "Total unique combinations generated: $(wc -l < "$output_file")"
