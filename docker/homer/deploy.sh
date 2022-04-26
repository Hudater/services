#!/bin/sh

# Creating directories to hold config files etc
mkdir -p /home/$USER/.config/homer
touch "${BAK_CFG_DIR}"/homer/config.yml
mkdir -p "${BAK_CFG_DIR}"/homer/manicons

# deploying container
docker-compose up -d

# cloning custom theme for homer
git clone https://github.com/WalkxCode/Homer-Theme.git /home/$USER/Homer-Theme
sudo chmod -R 777 /home/$USER/Homer-Theme

# deleting default config. DON'T DO THIS IF YOU DON'T WANT CUSTOM THEME
sudo chmod -R 777 /home/$USER/.config/homer
find /home/$USER/.config/homer/* ! -name 'manicons' ! -name 'config.yml' -type d,f -exec rm -rf "{}" +

# moving custom theme files to homer dir
mv /home/$USER/Homer-Theme/assets/config.yml /home/$USER/Homer-Theme/assets/og-config.yml
mv /home/$USER/Homer-Theme/assets/* /home/$USER/.config/homer/

# removing the custom theme git dir
rm -rf /home/$USER/Homer-Theme
