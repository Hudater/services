#!/bin/sh

# Creating directories to hold config files etc
mkdir -p /home/$USER/GitIt/SyncFiles/configBak/homer
mkdir -p /home/$USER/GitIt/SyncFiles/configBak/homer/manicons

# deploying container
docker-compose up -d

# cloning custom theme for homer
git clone https://github.com/WalkxCode/Homer-Theme.git /home/$USER/Bench/Homer-Theme

# deleting default config. DON'T DO THIS IF YOU DON'T WANT CUSTOM THEME
find /home/$USER/GitIt/SyncFiles/configBak/homer/* ! -name 'manicons' -type d,f -exec rm -rf {} +

# moving custom theme files to homer dir
mv /home/$USER/Bench/Homer-Theme/assets/* /home/$USER/GitIt/SyncFiles/configBak/homer/

# removing the custom theme git dir
rm -rf /home/$USER/Bench/Homer-Theme