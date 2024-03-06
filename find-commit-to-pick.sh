#!/bin/bash
while IFS= read -r line
do
    commit_hash=$(echo "$line" | cut -d ' ' -f 1)
    commit_title=$(echo "$line" | cut -d ' ' -f 2-)
    if ! grep -q "$commit_title" 12-all-riscv+vect-commit; then
        echo "$line" >> master-12-really-need-pick
        echo "$commit_title"
    fi
done < master-all-riscv+vect-commit
