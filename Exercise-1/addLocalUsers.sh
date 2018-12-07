#!/bin/bash

#This script will add users to local system

# Ask user for username
read -p "Enter username for aacount : " USER_NAME

# Ask user for realname
read -p "Enter name of user for which this account is being created : " COMMENT

# Ask user for password
read -p "Enter password for account : " PASSWORD

# Create a useraccount
useradd -c "${COMMENT}" -m ${USER_NAME}

# Set password to user account
echo "$PASSWORD" | passwd --stdin ${USER_NAME}

# Force user to change password at very next login
passwd -e ${USER_NAME}
