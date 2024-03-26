#!/bin/bash

#/etc/passwd

# Check if the file name is "passwd"
if [ "$(basename $1)" != "passwd" ]; then
    echo "Error: File name must be 'passwd'."
    exit 1
fi

# 1. Print the home directory
echo "1. Home Directory:"
awk -F: '{print $6}' $1

# 2. List all usernames
echo -e "\n2. List of all usernames:"
awk -F: '{print $1}' $1

# 3. Count the number of users
echo -e "\n3. Number of users:"
awk -F: 'END {print NR}' $1

# 4. Find the home directory of a specific user
read -p "Enter the username to find home directory: " username
echo "4. Home directory of user $username:"
awk -F: -v user="$username" '$1 == user {print $6}' $1

# 5. List users with specific UID range
echo -e "\n5. List of users with UID between 2 and 3:"
awk -F: '$3 >= 2 && $3 <= 3 {print $1}' $1

# 6. Find users with standard shells
echo -e "\n6. Users with standard shells (/bin/bash or /bin/sh):"
awk -F: '$NF ~ /\/bin\/(bash|sh)$/ {print $1}' $1

# 7. Replace "/" character with "\" character in the entire /etc/passwd file and redirect the content to a new file
echo -e "\n7. Replacing '/' with '\' and saving to new file 'passwd_replaced':"
sed 's/\//\\/g' $1 > passwd_replaced

# 8. Print the private IP
echo -e "\n8. Private IP:"
hostname -I | awk '{print $1}'

# 9. Print the public IP
echo -e "\n9. Public IP:"
curl ifconfig.me

# 10. Switch to john user
echo -e "\n10. Switching to 'john' user:"
su - john -c "echo 'Currently logged in as: \$USER'"

# 11. Print the home directory of john user
echo -e "\n11. Home directory of 'john' user:"
awk -F: '/john/ {print $6}' $1
