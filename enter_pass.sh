echo "input:"

charcount=0
while IFS= read -p "$prompt" -r -s -n 1 char
do
    # Enter - accept password
    if [[ $char == $'\0' ]]; then
        break
    fi
    # Delete
    if [[ $char == $'\177' ]]; then
        if [ $charcount -gt 0 ]; then
            charcount=$((charcount-1))
            prompt=$'\b \b'
            password="${password%?}"
        else
            prompt=''
        fi
    else
        prompt='*'
        password+="$char"
        charcount=$((charcount+1))
    fi
done
echo
echo "Done, read: $password"
