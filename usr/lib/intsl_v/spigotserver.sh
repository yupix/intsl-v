#!/usr/bin/env bash
while :; do
    if [[ -z $INPUT_SERVER_VERSION ]]; then
        read -r -p ">" INPUT_SERVER_VERSION
    else
        echo "入力したバージョン: $INPUT_SERVER_VERSION"
    fi
    case $INPUT_SERVER_VERSION in
    1.8 | 1.8.1 | 1.8.2 | 1.8.3 | 1.8.4 | 1.8.5 | 1.8.6 | 1.8.7 | 1.8.8 | 1.8.9)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.9 | 1.9.1 | 1.9.2 | 1.9.3 | 1.9.4)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.10 | 1.10.1 | 1.10.2 | 1.11 | 1.11.1 | 1.11.2)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.12 | 1.12.1 | 1.12.2)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.13 | 1.13.1 | 1.13.2)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.14 | 1.14.1 | 1.14.2 | 1.14.3 | 1.14.4)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.15 | 1.15.1 | 1.15.2)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    1.16)
        buildversion="$INPUT_SERVER_VERSION"
        break
        ;;
    *)
        echo "存在しないバージョンです"
        read -r -p ">" INPUT_SERVER_VERSION
        ;;
    esac
done
