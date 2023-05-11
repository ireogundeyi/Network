#!/bin/bash

# Define the main menu

# This is to clear the terminal
main_menu() {
    clear
    echo "Choose an option:"
    echo "1. Create a file"
    echo "2. Create a directory"
    echo "3. Rename a file or directory"
    echo "4. Move a file or directory"
    echo "5. Delete a file or directory"
    echo "6. Exit"
}

# Define the create file function

create_file() {
    read -p "Enter filename: " filename
    touch $filename
    echo "$filename created"
}

# Define the make directory function

create_directory() {
    read -p "Enter directory name: " dirname
    mkdir $dirname
    echo "Directory $dirname has been created"
}

# Define the rename file function

rename_file() {
    read -p "Old name: " oldname
    read -p "New name: " newname
    mv $oldname $newname
    echo "filename has changed from $oldname to $newname"
}

# Define the move file function
# same as rename, but would i need to check if 
# there is a file in the directory
move_file() {
    read -p "Old name: " oldname
    read -p "New name: " newname
    mv $oldname $newname
    echo "filename has changed from $oldname to $newname"
}

# Define a file or directory
delete_file() {
    read -p "File or directory to delete: " filename
    read -p "You sure? [y/n] " choice
    if [ "$choice" == "y" ]; then
        rm -r $filename
        echo "File or directory has been deleted"
    else
        echo "File or directory has not been deleted"
    fi    
}

while true; do 
    main_menu
    read -p "Enter your option: " option
    case $option in 
        1) create_file ;;
        2) create_directory ;;
        3) rename_file ;;
        4) move_file ;;
        5) delete_file ;;
        *) echo "Invalid option!"
    esac
    read -p "Press any key to continue"
done

