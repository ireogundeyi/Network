# RS - record separator. AWk processes one RECORD at a time.
# This is what is used to split the input data into different RECORDS
# By default 'newline' 
# So a file with 3 lines would have 3 records by default

# NR - The current input record number
# So if you have a file with 3 lines, NR is 3

# FS/OFS -(Output) Field separator. This is used to split the records into fields
# based on what FS is
# When printing output it will use OFS to join the records back together

# NF - the number of fields in the current record. 
# If you are using white space as delimiter it will match the amount of
# words in the record

# Print the contents in the file
# pattern { action } 
# since 1 is true then it works and since print is default action it prints file
awk 1 textfiles/awktestfile

# Remove the file header
awk 'NR>1' textfiles/awktestfiles

# Print lines in a range
awk 'NR>1 && NR<4' textfiles/awktestfiles

# Removing whitespace-only lines
# When NF is true, then it will print lines with at least more than
# one field
awk 'NF' textfiles/awktestfiles

# Removing blank lines in a file
awk '1' RS='' textfiles/awktestfiles

# Extracting fields
# BEGIN block used to initialize field seperator
# $n to access the field
# NF to print 
awk 'BEGIN { FS=OFS="," } NF { print $1, $3 }' textfiles/awktestfile

# Adding numbers in the first variable
awk 'BEGIN { FS=OFS="," } NF { SUM+=$1 } END { print SUM }' textfiles/awktestfile

# Counting number of non empty lines

awk '/./ { COUNT+=1 } END { print COUNT }' textfiles/awktestfile

# Print total credit for all users
# the plus infront of the $1 forces it to only focus on the numbers
# arrayname[string]=value is the structure for arrays
# so this means that the values in the third field which is the users
# would be the index and for each user the credit associated to them is added up

awk '+$1 { CREDITS[$3]+=$1 } 
    END { for (NAME in CREDITS) print NAME, CREDITS[NAME] }' FS=, textfiles/awktextfile

# Finding duplicate lines
# initally it reads the records ($0 is the whole line
# and sets it at 0. 
# if it sees another line the same it increments it by 1 and 
# since 1 is non-zero therefore true so awk prints it
# if it sees it again it increments it and adds another 1 making it
# two and since two is also non-zero it will print it as well. 

awk 'a[$0]++' textfiles/awktestfile

# Remove all duplicate lines and remove empty lines
awk 'NF && !a[$0]++' textfiles/awktestfile

# Change the field seperator
# Also gets rid of empty lines because it is false for the empty strings 
awk '$1=$1' FS=, OFS=' ' textfiles/awktestfile

# Removing multiple spaces
# Since default field separator is white space then it collects 
# multiple whitespace characters and the output is only one space
awk '$1=$1' textfiles/awktestfile

# Joining lines from a field 
# Use ORS to separate the records 
awk '/[^[:space:]]/ { print $3 }' FS=, ORS=' ' textfiles/awktestfile; echo

# Set the ORS to space so SEP gets added before a field but since 
# there is no field before the first it doesnt add one.
awk '/[^[:space:]]/ { print SEP $3; SEP="+" }' FS=, ORS='' file; echo

# Joining lines from a field using printf
# %s is for formatting string
awk '+$1 { printf("%s ", $3) }' FS=, textfiles/awktestfile

# Producing tabular results
# The number 10 pads it with a fixed width length of 10 to the right so 
# string occupies 10 characters 
# the 4 pads the numbes to a fixed width length of 4 to the right as well
awk '+$1 { printf("%10s | %4d\n", $3, $1) }' FS=, textfiles/awktestfile

# This version pads it to the left using '-' in front of the 10
awk '+$1 { printf("%-10s | %04d\n", $3, $1) }' FS=, textfiles/awktestfile

# Print average of the credits
# The number .3 means how many decimal places
# The number 4 represents how much character width we would want but since decimal point takes priority
# it goes beyond 4
awk '+$1 { SUM+=$1; NUM+=1 } END { printf("AVG=%4.3f", SUM/NUM) }' FS=, textfiles/awktestfile; echo

# Print to upper
# The $3 is added so that it only prints to upper records that have a non empty value in the 
# field $3
awk ' $3 { print toupper($0) }' textfiles/awktestfile

# Using substr 
# the 3 arguments in the substr take the field you are evauluating
# the 2nd one means the character you want to start at and the 
# 3rd one means the how many characters you want to evauluate.
# if there is no 3rd arg it means all the remaining characters
awk '{ $3 = toupper(substr($3,1,1)) substr($3,2) } $3' FS=, OFS=, textfiles/awktestfile 

# Splitting fields into subfields
awk '+$1 { split($2, DATE," "); print $1, $3, DATE[2], DATE[3] }' FS=, OFS=, textfiles/awktestfile

# Splittig the group field using regex
awk '+$1 { split($4, GRP, /:+/); print $3, GRP[1], GRP[2] }' FS=, textfiles/awktestfile

# Searching and replacing using gsub
awk '+$1 { gsub(/ +/, "-", $2); print }' FS=, textfiles/awktestfile

# Printing the date in the file
# skips any line that starts with updated using regex and next
awk ' BEGIN { printf("UPDATED: "); system("date") } /^UPDATED/ { next } 1' textfiles/awktestfile

# Modifying a field externally 
awk '+$1 { CMD | getline $5; close(CMD); print }' CMD="uuidgen" FS=, OFS=, textfiles/awktestfile