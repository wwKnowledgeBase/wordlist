#!/bin/bash

output_file="three_char_letter_combinations.wordlist"

> "$output_file"

echo "Generating all 3-letter combinations (a-z)..."

for i in {a..z}; do
  for j in {a..z}; do
    for k in {a..z}; do
      echo "${i}${j}${k}" >> "$output_file"
    done
  done
done

echo "Combinations saved to '$output_file'."
echo "Total combinations generated: $(wc -l < "$output_file")"
