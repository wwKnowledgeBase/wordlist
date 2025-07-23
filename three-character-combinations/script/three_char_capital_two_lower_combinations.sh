#!/bin/bash

output_file="three_char_capital_two_lower_combinations.wordlist"

capital_letters="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
lowercase_letters="abcdefghijklmnopqrstuvwxyz"

> "$output_file"

echo "Generating all 3-character combinations (one capital letter, two lowercase letters)..."

# --- Pattern 1: Capital + Lower + Lower (CLL) ---
# Example: Aah, Bcd
for (( c_idx=0; c_idx<${#capital_letters}; c_idx++ )); do
  char_cap="${capital_letters:$c_idx:1}"
  for (( l1_idx=0; l1_idx<${#lowercase_letters}; l1_idx++ )); do
    char_lower1="${lowercase_letters:$l1_idx:1}"
    for (( l2_idx=0; l2_idx<${#lowercase_letters}; l2_idx++ )); do
      char_lower2="${lowercase_letters:$l2_idx:1}"
      echo "${char_cap}${char_lower1}${char_lower2}" >> "$output_file"
    done
  done
done

# --- Pattern 2: Lower + Capital + Lower (LCL) ---
# Example: aBh, cDe
for (( l1_idx=0; l1_idx<${#lowercase_letters}; l1_idx++ )); do
  char_lower1="${lowercase_letters:$l1_idx:1}"
  for (( c_idx=0; c_idx<${#capital_letters}; c_idx++ )); do
    char_cap="${capital_letters:$c_idx:1}"
    for (( l2_idx=0; l2_idx<${#lowercase_letters}; l2_idx++ )); do
      char_lower2="${lowercase_letters:$l2_idx:1}"
      echo "${char_lower1}${char_cap}${char_lower2}" >> "$output_file"
    done
  done
done

# --- Pattern 3: Lower + Lower + Capital (LLC) ---
# Example: abh, cdeF
for (( l1_idx=0; l1_idx<${#lowercase_letters}; l1_idx++ )); do
  char_lower1="${lowercase_letters:$l1_idx:1}"
  for (( l2_idx=0; l2_idx<${#lowercase_letters}; l2_idx++ )); do
    char_lower2="${lowercase_letters:$l2_idx:1}"
    for (( c_idx=0; c_idx<${#capital_letters}; c_idx++ )); do
      char_cap="${capital_letters:$c_idx:1}"
      echo "${char_lower1}${char_lower2}${char_cap}" >> "$output_file"
    done
  done
done

# Sort the file and remove any potential duplicates (ensures a clean list)
sort -u -o "$output_file" "$output_file"

echo "Generation complete! All combinations saved to '$output_file'."
echo "Total unique combinations generated: $(wc -l < "$output_file")"
