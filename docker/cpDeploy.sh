for i in ./* # iterate over all files in current dir
do
    if [ -d "$i" ] # if it's a directory
    then
        cp deploy.sh "$i" # copy water.txt into it
    fi
done


# Resource: https://askubuntu.com/a/300763