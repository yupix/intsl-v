#!/usr/bin/env bash
while :; do
    echo "$INPUT_SERVER_VERSION"
    if [[ -z $INPUT_SERVER_VERSION ]]; then
        read -p ">" INPUT_SERVER_VERSION
    fi
    case $INPUT_SERVER_VERSION in
    1.8)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.8.1)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.8.2)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.8.3)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.8.4)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.8.5)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.8.6)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.8.7)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.8.8)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.8.9)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.9)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.9.1)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.9.2)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.9.3)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.9.4)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.10)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.10.1)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.10.2)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.11)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.11.1)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.11.2)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.12)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.12.1)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.12.2)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.13)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.13.1)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.13.2)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.14)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.14.1)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.14.2)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.14.3)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.14.4)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.15)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.15.1)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.15.2)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.16)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    *)
        echo "変な数値打たないで"
        ;;
    esac
done
