SRC_FILE=$1 
OPTIONS=$2
if [ -z "$SRC_FILE"]; then
    echo "Choose a keyboard first!"
else
    bash "$HOME/60percent/keyboards/$SRC_FILE.sh" $OPTIONS
fi
