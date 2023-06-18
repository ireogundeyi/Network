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

# Log in as user1 and create user 4 and 5
# Create groups - app, database

sudo su - user1 
sudo useradd user4
sudo passwd user4
sudo useradd user5
sudo passwd user5

sudo groupadd app
sudo groupadd database

#Login as ‘user4’ and perform below
#Create directory – /dir6/dir4
#Create file – /f3
#Move the file from “/dir1/f1” to “/dir2/dir1/dir2”
#Rename the file ‘/f2′ to /f4’

sudo mkdir /dir6/dir4
touch f3
mv /dir1/f1 dir2/dir1/dir2
mv /f2 /f4

#Login as ‘user1’ and perform below
#Create directory – “/home/user2/dir1”
#Change to “/dir2/dir1/dir2/dir10” directory and create file “/opt/dir14/dir10/f1” using relative path method.
#Move the file from “/opt/dir14/dir10/f1” to  user1 home directory
#Delete the directory recursively “/dir4”
#Delete all child files and directories under “/opt/dir14” using single command.
#Write this text “Linux assessment for an DevOps Engineer!! Learn with Fun!!” to the /f3 file and save it.

mkdir -p /home/user2/dir1
cd /dir2/dir1/dir2/dir10 && touch /opt/dir14/dir10/f1
sudo mv -v /opt/dir14/dir10/f1 /home/user1
rm -rfv /dir4
sudo rm -rfv /opt/dir14/*
echo Linux assessment for an DevOps Engineer!! Learn with Fun!! > /f3

#Login as ‘user2’ and perform below
#Create file “/dir1/f2”
#Delete /dir6
#Delete /dir8
#Replace the “DevOps” text to “devops” in the /f3 file without using  editor.
#Using Vi-Editor copy the line1 and paste 10 times in the file /f3.
#Search for the pattern “Engineer” and replace with “engineer” in the file /f3 using single command.
#Delete /f3

su - user2
touch /dir1/f2
rm -rf /dir6
rm -rf /dir8
sed -i 's/Devops/devops/g' /f3
sed -ie 's/Engineer/engineer/g' /f3
rm /f3

#Search for the file name ‘f3’ in the server and list all absolute  paths where f3 file is found.
#Show the count of the number of files in the directory ‘/’
#Print last line of the file ‘/etc/passwd’

find . -name f3
ls / | wc -l
find / -type f 2>dev/null | wc -l ## count recursively
tail -1 /etc/passwd

#Login to AWS and create 5GB EBS volume in the same AZ of the EC2 instance and attach EBS volume to the Instance.
#Login as ‘root’user and perform below
#Create File System on the new EBS volume attached in the previous step
#Mount the File System on /data directory
#Verify File System utilization using ‘df -h’ command – This command must show /data file system
#Create file ‘f1’ in the /data file system.

lsblk # to list disks
sudo file -s /dev/xvdf # to check where there is any data in the volume
sudo mkfs -t ext4 /dev/xvdf
sudo mkdir /data
sudo mount /dev/xvdf /data/
cd /data
df -h

#Login as ‘user5’ and perform below
#Delete /dir1
#Delete /dir2
#Delete /dir3
#Delete /dir5
#Delete /dir7
#Delete /f1 & /f4
#Delete /opt/dir14

sudo rm -rf {/dir1,/dir2,/dir3,/dir5,/dir7}
rm {/f1,/f4}
sudo umount /dev/xvdf
sudo rm -rf /data/
