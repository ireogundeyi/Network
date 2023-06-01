#!/bin/bash

# Shell scripts that help my understanding for using sed, awd and grep

# A script that searches for a pattern in a file using grep and prints out the matching lines.


find_pattern() {
    read -p "Pattern you would like to find: " pattern
    read -p "File you would like to search: " filename
    matching_pattern=$(grep "$pattern" "$filename")
    echo "Matching patterns: $matching_pattern" 

}

# A script that replaces a pattern with a new string in a file using sed.

replace_string() {
    read -p "File you would like to alter: " filename
    read -p "String you would like to replace: " oldstring
    read -p "New String: " newstring
    sed -i "s/$oldstring/$newstring/g" $filename
    echo "Has been replaced"

}

# A script that extracts data from a CSV file using awk.

extract_data() {
    echo "Enter the name of the file to extract data from: "
    read filename
    # Use awk to extract data from file
    awk '/[0-9]+\.[0-9]+/ {print $1, $2}' "$filename"
    
}
# A script that sorts and filters data in a file using awk.

sort_filter_data() {
    read -p "Enter the name of the file: "
    # Filters on field 3 numbers greater than 100 and prints the first three fields
    # Sort by field 3 and in reverse numerical order
    awk '{if ($3 > 100) print $1, $2, $3}' "filename" | sort -k3 -nr
}

# A script that joins data from two files using awk.
join_twofiles() {
    read -p "Enter the name of the first file: " file1
    read -p "Enter the name of the second file: " file2
    awk 
}
# A script that processes log files and extracts specific information using grep and awk.
# A script that manipulates and transforms text using sed.
# A script that finds and removes duplicates in a file using awk.
# A script that counts the number of occurrences of a word in a file using grep.
# A script that extracts and reformats data from a text file using awk and sed.