# This is to test my linux user management, permissions
# directory structure, file systems, file management
# Link: https://devopsrealtime.com/fun-with-linux-for-cloud-devops-engineers/

# This was performed on a linux based EC2 instance

# Create users and set passowrds
sudo useradd user1
sudo passwd user1
sudo useradd user2
sudo passwd user2
sudo useradd user3
sudo passwd user3

# Create groups called Devops, AWS
sudo groupadd devops
sudo groupadd aws

# Change primary group of user2 & user3 to devops
sudo usermod -g devops user3
sudo usermod -g devops user2

# Add user 1 to secondary group aws
sudo usermod -aG aws user1

# Change group of /dir1, /dir7/dir10, /f2 to “devops” group
sudo chgrp -v devops dir1 dir7/dir10/ f2

# Change ownership of /dir1, /dir7/dir10, /f2 to “user1” user.
sudo chown -vc user1 dir1 dir7/dir10/ f2 

# Log in as user1
sudo su - user1 






