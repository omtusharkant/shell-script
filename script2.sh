#!/bin/bash

<< Comment
Description : A shell script to install or uninstall any package using apt
Author : Tommarcusbrut
Date : 12-07-2024
Comment

echo "I. Install any Package"
echo "U. Uninstall any Package"
echo "e. Exit"

read -p "Enter Choice : " cho

case $cho in

I)
    read -p "Enter package name : " pname
    sudo apt update -y  # Update package lists
    sudo apt install $pname -y  # Install the specified package
    ;;

U)
    read -p "Enter package name : " name
    sudo apt list --installed | grep -i $name  # List installed packages matching the name
    read -p "Enter package name to uninstall : " package_to_uninstall
    sudo apt remove $package_to_uninstall -y  # Remove the specified package
    sudo apt-get purge $package_to_uninstall -y  # Purge configuration files of the package
    sudo apt clean  # Clean up cached packages
    sudo apt autoclean  # Remove old versions of installed packages
    echo "git completely removed"
    sudo find / -type d -name "*.git"

    ;;

e)
    echo "Exiting"
    exit 0
    ;;

*)
    echo "Invalid option"
    ;;

esac
