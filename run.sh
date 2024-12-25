SRC_FILE=$1 
OPTIONS=$2
BASE_DIR="$HOME/60percent"
if [ -z "$SRC_FILE" ]; then
    echo "Choose a keyboard first!"
    ls "$BASE_DIR/keyboards"
else
    bash "$BASE_DIR/keyboards/$SRC_FILE.sh" $OPTIONS
fi