#!/bin/sh

# Creating directories to hold config files etc
mkdir -p "${BAK_CFG_DIR}"/homer
mkdir -p "${BAK_CFG_DIR}"/homer/manicons

# deploying container
docker-compose up -d

# cloning custom theme for homer
git clone https://github.com/WalkxCode/Homer-Theme.git /home/$USER/Bench/Homer-Theme

# deleting default config. DON'T DO THIS IF YOU DON'T WANT CUSTOM THEME
find "${BAK_CFG_DIR}"/homer/* ! -name 'manicons' -type d,f -exec rm -rf "{}" +

# moving custom theme files to homer dir
mv /home/$USER/Bench/Homer-Theme/assets/* "${BAK_CFG_DIR}"/homer/

# removing the custom theme git dir
rm -rf /home/$USER/Bench/Homer-Theme