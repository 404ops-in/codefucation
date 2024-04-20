key=$(cat private.pem)
decrypt(){
    if [ -f "$1" ]; then
        if [[ "$1" == *.enc ]]; then
            openssl aes-256-cbc -d -in "$1" -out "$(echo $1 | sed 's/.enc//g')" -k "$key" -pbkdf2
            if [ "$?" == "0" ]; then
                rm "$1"
            fi
            echo "Decrypted $1"
        else
            echo "File is not encrypted"
        fi
    else
        echo "File not found"
    fi
}

encrypt(){
    if [ -f "$1.enc" ]; then
        echo "File already encrypted"
    else
        openssl aes-256-cbc -e -in "$1" -out "$1.enc" -k "$key" -pbkdf2
        if [ "$?" == "0" ]; then
            rm "$1"
        fi
        echo "Encrypted $1"
    fi
}
# if [ -z $key ]
# then
if [ "$1" == "decrypt" ]; then
    decrypt "$2"
elif [ "$1" == "encrypt" ]; then
    encrypt "$2"
else
    echo "Usage: $0 [encrypt|decrypt] file"
fi
# else
# echo "Key not Found"
# # fi