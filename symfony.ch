#!/bin/bash

# Step 1: Enter the PHP container
./shell.sh

# Step 2: Create new vhost directory
read -p "Enter the vhost directory name: " vhost_dir
mkdir $vhost_dir

# Step 3: Install Symfony
cd $vhost_dir
symfony new symfony

# Step 4: Symlink webroot
ln -s symfony/public/ htdocs

# Step 5: DNS record
read -p "Enter the hostname for the project: " hostname
echo "127.0.0.1 $hostname" | sudo tee -a /etc/hosts

# Step 6: Open your browser
echo "Visit http://$hostname in your browser"
