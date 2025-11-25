#!/bin/sh
mkdir -p "${BAK_CFG_DIR}"/revanced
# env file setup
envFile="${BAK_CFG_DIR}/revanced/.env"
if [ ! -f "$envFile" ]; then
    wget -O "$envFile" https://raw.githubusercontent.com/nikhilbadyal/docker-py-revanced/main/.env.example
    printf "This is a sample file from developer!\nPlease visit official docs before editing file:\nhttps://github.com/nikhilbadyal/docker-py-revanced#configurations\n"
    #Asking whether to open file in $EDITOR or not
    echo "
        This is a sample file from developer!
        Please visit official docs before editing file:
        https://github.com/nikhilbadyal/docker-py-revanced#configurations
        Open $EDITOR to edit env file? (Y/n):"
    while true; do
    read -r REPLY
    REPLY="${REPLY:=y}"
    case $REPLY in
        [Yy]) $EDITOR "$envFile" && break;;
        #asking whether to keep env file or not and then exit instllation
        [Nn])
            echo "        Would you like to remove dowloaded Sample env file (Y/n): "
                while true; do
                read -r REPLY
                REPLY="${REPLY:=y}"
                case $REPLY in
                    [Yy]) rm -rf "$envFile" && echo "Removed env file! Exiting installation..." && break;;
                    [Nn]) echo "Exiting installation..." && break;;
                    *) printf '%s' '        Please answer Y or n: ' ;;
                esac
                done
            exit 0 ;;

        *) printf '%s' '        Please answer Y or n: ' ;;
    esac
    done
#continue to deploy image if env file already exists
#NOTE: script doesn't check if env file is valid or not
else
    echo "env file already exists."
fi

docker compose up -d
