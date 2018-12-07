#!/bin/bash

#This script will create user account on local linux system where this script is
#running.

# Make sure the script is being executed with superuser privileges.
UID_HOST=$(id -u)
if [[ "$UID_HOST" -ne 0 ]];then
	echo "Please run with sudo or as root."
	exit 1
fi

# Get the username (login).
read -p "Enter username for aacount : " USER_NAME

# Get the real name (contents for the description field).
read -p "Enter name of user for which this account is being created : " COMMENT

# Get the password.
read -p "Enter password for account : " PASSWORD

# Create the user with the password.
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check to see if the useradd command succeeded.
if [[ "$?" -ne 0 ]];then
    echo "The account was not able to be created for some reason"
    exit 1
fi

# Set the password.
echo "$PASSWORD" | passwd --stdin ${USER_NAME}

# Check to see if the passwd command succeeded.
if [[ "$?" -ne 0 ]];then
    echo "The account was not able to be created for some reason"
    exit 1
fi

# Force password change on first login.
passwd -e ${USER_NAME}

# Display the username, password, and the host where the user was created.
echo "username: ${USER_NAME}"
echo "password: ${PASSWORD}"
echo "host: $(hostname)"
exit 0
