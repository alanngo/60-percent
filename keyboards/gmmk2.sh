function fn() {
    local key=$1
    local mapping=$2
    echo "($key) -> [ Fn + $mapping ]"
}
function printArray() {
    local ARR=("$@")
    for elem in "${ARR[@]}"; do
        echo $elem
    done
}
function specialChars() {
    local ARR=(
        "$(fn '`' "Esc")"
        "$(fn '~' "Shift + Esc")"
    )
    printArray "${ARR[@]}"
}
function fnKeys() {
    local ARR=(
        "$(fn 'F1' "1")"
        "$(fn 'F2' "2")"
        "$(fn 'F3' "3")"
        "$(fn 'F4' "4")"
        "$(fn 'F5' "5")"
        "$(fn 'F6' "6")"
        "$(fn 'F7' "7")"
        "$(fn 'F8' "8")"
        "$(fn 'F9' "9")"
        "$(fn 'F10' "0")"
        "$(fn 'F11' "-")"
        "$(fn 'F12' "+")"
    )
    printArray "${ARR[@]}"
}

function arrowKeys() {
    local ARR=(
        "$(fn 'up' "I")"
        "$(fn 'left' "J")"
        "$(fn 'down' "K")"
        "$(fn 'right' "L")"
    )
    printArray "${ARR[@]}"
}
function controlPad() {
    local ARR=(
        "$(fn 'Insert' ";")"
        "$(fn 'Delete' "'")"
        "$(fn 'Home' "N")"
        "$(fn 'End' "M")"
        "$(fn 'PageUp' "U")"
        "$(fn 'PageDown' "O")"
        "$(fn 'PrntScrn' "P")"
        "$(fn 'ScrollLk' "{")"
        "$(fn 'Pause' "}")"
    )
    printArray "${ARR[@]}"
}
function volume() {
    local ARR=(
        "$(fn 'Mute' ",")"
        "$(fn 'Vol Down' ".")"
        "$(fn 'Vol Up' "/")"
    )
    printArray "${ARR[@]}"

}
function all() {
    specialChars
    fnKeys
    arrowKeys
    controlPad
    volume
}

ARG=$1

case $ARG in
special)
    secialChars
    ;;
fn)
    fnKeys
    ;;
arrow)
    arrowKeys
    ;;
control)
    controlPad
    ;;
volume)
    volume
    ;;
*)
    [[ -z "$ARG" ]] && all || all | grep $ARG -iE
    ;;
esac
