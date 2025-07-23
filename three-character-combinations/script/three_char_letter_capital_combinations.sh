#!/bin/bash

output_file="three_char_letter_capital_combinations.wordlist"

> "$output_file"

echo "Generating all 3-letter combinations (A-Z)..."

for i in {A..Z}; do
  for j in {A..Z}; do
    for k in {A..Z}; do
      echo "${i}${j}${k}" >> "$output_file"
    done
  done
done

echo "Combinations saved to '$output_file'."
echo "Total combinations generated: $(wc -l < "$output_file")"
