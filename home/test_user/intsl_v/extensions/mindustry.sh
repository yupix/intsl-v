#!/usr/bin/env bash
geturl=$(curl -s https://github.com/Anuken/Mindustry/releases/latest | grep -oE 'http(s?)://[0-9a-zA-Z?=#+_&:/.%]+')
getversion=$(echo "${geturl}" | sed 's/https\:\/\/github.com\/Anuken\/Mindustry\/releases\/tag\/v//g')
SCREEN_NAME="mindustry"
JAVA_BIN="java"
SERVER_PATH="./mindustry/"
SERVER_FILE="server-release.jar"
#拡張機能名
IEXT="mindustry"
#拡張機能バージョン
INTEXT="110"
#拡張機能の最新バージョンを記載しているファイルのURL(Gitlab等を張る)
VURL="https://dev.akarinext.org/yupix/intsl-on-mindustry/-/raw/master/newversion.txt"

echo "使用するコマンドを入力してください。"
while :; do
    read -p ">" INPUT_DATA
    case $INPUT_DATA in
    start)
        while :; do
            if [[ -e ./lib/server-release.jar ]]; then
                echo "ファイルが存在します。"
                break
            else
                echo "ファイルが存在しません。ダウンロードします。"
                wget -q https://github.com/Anuken/Mindustry/releases/download/v${getversion}/server-release.jar -P ./lib
            fi
        done
        while :; do
            if [[ ! -e ./mindustry ]]; then
                mkdir ./mindustry
            fi
            if [[ -e ./mindustry/server-release.jar ]]; then
                echo "サーバーを開始します。"
                screen -AdmS $SCREEN_NAME $JAVA_BIN -jar $SERVER_PATH$SERVER_FILE nogui
                break
            else
                echo "ファイルをコピーします。"
                cp ./lib/server-release.jar ./mindustry/
            fi
        done
        ;;

    createworld)
        read -p ">" INPUT_DATA
        case $INPUT_DATA in
        fork)
            WORLD_TYPE="fork"
            ;;
        fortress)
            WORLD_TYPE="fortress"
            ;;
        glacier)
            WORLD_TYPE="glacier"
            ;;
        islands)
            WORLD_TYPE="islands"
            ;;
        labyrinth)
            WORLD_TYPE="labyrinth"
            ;;
        maze)
            WORLD_TYPE="maze"
            ;;
        shattered)
            WORLD_TYPE="shattered"
            ;;
        tendrils)
            WORLD_TYPE="tendrils"
            ;;
        triad)
            WORLD_TYPE="triad"
            ;;
        veins)
            WORLD_TYPE="veins"
            ;;
        wasteland)
            WORLD_TYPE="wasteland"
            ;;
        custom)
            echo "world名を入力してください。"
            read -p ">" $INPUT_DATA
            WORLD_TYPE="$INPUT_DATA"
            ;;
        esac
        screen -S $SCREEN_NAME -p 0 -X stuff "host ${WORLD_TYPE} $(echo -ne '\r')"
        ;;

    loadworld)
        screen -S $SCREEN_NAME -p 0 -X stuff "load  $(echo -ne '\r')"
        ;;

    save)
        echo "ファイル名を入力してください。"
        read -p ">"
        screen -S $SCREEN_NAME -p 0 -X stuff "save $INPUT_NAME $(echo -ne '\r')"
        ;;

    see)
        screen -r $SCREEN_NAME
        ;;
    esac
done
##author
#・yupix
#・sousuke0422