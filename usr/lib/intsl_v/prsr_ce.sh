#!/usr/bin/env bash
echo "サーバーを起動する際のコマンドを指定してください"
if [[ -z "${input_server_name}" ]]; then
    read -p ">" input_server_name
fi
if [[ ${setting_package_mode} = "false" ]]; then
    mc_server_create_file_dir="home/test_user/intsl_v"
elif [[ ${setting_package_mode} = "true" ]]; then
    mc_server_create_file_dir="${HOME}/intsl_v"
fi
if [[ -e "${mc_server_create_file_dir}/${input_server_name}" ]]; then
    echo "既に存在するサーバーです。"
    exit 1
fi
mkdir $mc_server_create_file_dir/${input_server_name}
mc_donwload_version="$INPUT_SERVER_VERSION"
if [[ ${mc_server_edition} = official ]]; then
    srce_edision="server"
    cp ${mc_server_jar_file}${mc_server_edition}${mc_donwload_version}.jar $mc_server_create_file_dir/${input_server_name}
fi
sed -i ''${server_add_line}'i'${input_server_name}\)'' var/lib/intsl_v/server_list
sed -i ''${server_add_line}'a ;;' var/lib/intsl_v/server_list
sed -i ''${server_add_line}'a . ./minecraft/serversh/'${input_server_name}.sh'' var/lib/intsl_v/server_list
cat <<EOF >usr/lib/intsl_v/mc_server_run/${input_server_name}.sh
#!/usr/bin/env bash
#バックアップ用
WORLD_BACKUP(){
if [[ \$${input_server_name}_backup = yes ]];then
    . ./setting.txt
    if [[ ! -e ./backups ]]; then
        mkdir ./backups
    fi
    while :; do
        BACKUP_NAME=\$(date "+%Y%m%d-%H%M%S")
        tar -zcf \${BACKUP_NAME}.tar.gz ./\$${input_server_name}_backup_world_name
        mv ./\${BACKUP_NAME}.tar.gz ./\$${input_server_name}_backup_dir
        sleep \$${input_server_name}_backup_time
    done
else
    if [[ $first_dev_login = 0 ]]; then
        echo "バックアップ機能が無効です。"
    fi
fi
}
DISCORD_WEBHOOK_ON_OFF(){
echo "WebHookを有効にしますか?"
read -p ">" INPUT_WEBHOOK_TRUE
case \$INPUT_WEBHOOK_TRUE in
    [yY]|[yY][eE][sS]|[tT][rR][uU][eE])
        TRUE_OR_FALSE="true"
    ;;
    [nN]|[nN][oO]|[fF][aA][lL][sS][eE])
        TRUE_OR_FALSE="false"
    ;;
    *)
        echo "\$MISSING_INPUT_DATA_ME"
    ;;
esac
sed -i -e 's/'${input_server_name}_discord_webhook'="'\$${input_server_name}_discord_webhook'"/'${input_server_name}_discord_webhook'="'\$TRUE_OR_FALSE'"/' ./setting.txt
. ./setting.txt
if [[ \$TRUE_OR_FALSE = \$${input_server_name}_discord_webhook ]];then
    echo "変更に成功しました。"
else
    echo "変更に失敗しました。"
fi
}
cd ./${input_server_name}
while :; do
    #本番時はINPUT系に置き換え
    #${input_server_name}\SERVER
    echo "$INPUT_SERVER_NAMESERVER"
    echo "start | サーバーを起動します"
    echo "log | サーバーのlogを表示します"
    echo "cd | サーバーにコマンドを送信します"
    echo "settings | サーバー起動時の設定を変更できます"
    read -p ">" server
    case \$server in
    cd)
        while :; do
            . ./setting.txt
            if [[ \$${input_server_name}_STATUS = online ]]; then
                read INPUT_COMMAND
                case \$INPUT_COMMAND in
                exit)
                    echo "サービスを終了します"
                    break
                    ;;
                *)
                    screen -S \$SCREEN_NAME -p 0 -X stuff "say 残り10 秒\$(echo -ne '\r')"
                    ;;
                esac
            else
                echo "サーバーが起動していません"
                echo ""start"コマンドでサーバーを起動します"
            fi
        done
        ;;
    start)
        #本番時は$INPUT系に置き換え
        #SERVER_NAME="${input_server_name}" +
        FILE_SERVER_NAME="${input_server_name}"
        FILE_SERVER_PATH="${input_server_name}"
        #${srce_edision}${mc_donwload_version}.jar
        FILE_SERVER_FILE="${srce_edision}${mc_donwload_version}.jar"

        . ./setting.txt

        spinner_progress_status="ファイルの確認中"
        SPINNER
        #ファイルのチェック
        if [[ ! -e setting.txt ]]; then
            #ループs
            while :; do
                spinner_progress_status="ファイルの作成中"
                SPINNER
                if [[ \$RETRYCOUNT -le \$RETRYMAX ]]; then
                    if [[ ! -e setting.txt ]]; then
                        cd ../
                        . ./lib/main/server_default_settings.sh
                        cd ./\${input_server_name}
                        #ちゃんと\を入れる
                        RETRYCOUNT=$((RETRYCOUNT + 1))
                    else
                        echo "ファイルの作成に成功しました"
                        break
                    fi
                else
                    echo "ファイルの作成に失敗しました。"
                    echo "再度実行し、問題がある場合は作者に報告してください。"
                fi
            done
        fi

        #これを本番時はifに追加
        #${srce_edision}${mc_donwload_version}.jar
        spinner_progress_status="ファイルの確認中"
        SPINNER
        if [ -e ${srce_edision}${mc_donwload_version}.jar ]; then
            echo "JARファイルのチェックに成功"
            spinner_progress_status="ファイルの確認中"
            SPINNER
            if [[ -e eula.txt ]]; then
                #治す↓
                EULACONSENT=\$(cat ./eula.txt | grep eula=false | sed 's/eula=//g')
                #本番時は \$EULACONSENTにしないとからになる
                if [[ \false = \$EULACONSENT ]]; then
                    echo "EULA(MINECRAFT エンド ユーザー ライセンス条項)に同意していません。"
                    echo "こちらを読み、同意する場合は(Y)esキャンセルする場合は(N)oと入力してください"
                    echo "https://account.mojang.com/documents/minecraft_eula"
                    while :; do
                        read -p ">" INPUT_EULA_DATA
                        #本番時は$\INPUT_EULA_DATAにしないと空になる
                        case \$INPUT_EULA_DATA in
                        [yY])
                            echo "同意しました。"
                            sed -i -e 's/eula=false/eula=true/' ./eula.txt
                            break
                            ;;
                        [nN])
                            echo "キャンセルしました。"
                            break
                            ;;
                        *)
                            echo "${message_use_possible}"
                            ;;
                        esac
                    done
                fi
            else
                echo "eulaファイルが存在しません。JARファイルを一度実行します。"
                . ./setting.txt
                screen -AdmS \$${input_server_name}_SCREEN_NAME \$${input_server_name}_JAVA_HOME \$${input_server_name}_JVM_ARGUMENT -jar \$FILE_SERVER_FILE nogui
            fi
        else
            echo "JARファイルのチェックに失敗"
        fi

        #サーバー起動
        . ./setting.txt
        if [[ \$${input_server_name}_backup = yes ]];then
            kill \$${input_server_name}_BACKUP_PID
            WORLD_BACKUP &
            sed -i -e 's/'${input_server_name}_BACKUP_PID'="'\$${input_server_name}_BACKUP_PID'"/'${input_server_name}_BACKUP_PID'="'\$!'"/' ./setting.txt
        fi
        if [[ \$${input_server_name}_slack_webhook = true ]];then
            echo "└ \$${input_server_name}_discord_webhook"
        elif [[ \$${input_server_name}_discord_webhook = true ]];then
            curl -X POST -H "Content-Type: application/json" X POST -d @- \$${input_server_name}_discord_webhook_URL <<EOS
{"avatar_url":"\$${input_server_name}_webhook_avator","username":"\$${input_server_name}_discord_webhook_name","content":"✅ **Server has started**"}
EOS
        fi
        if [ "\$(screen -ls | grep \$${input_server_name}_SCREEN_NAME)" == "" ]; then
            spinner_progress_status="サーバーを起動中"
            SPINNER
            screen -AdmS \$${input_server_name}_SCREEN_NAME \$${input_server_name}_JAVA_HOME \$${input_server_name}_JVM_ARGUMENT -jar \$FILE_SERVER_FILE nogui
        else
            echo "サーバーは既に起動しています。"
        fi

        #PID取得用
        #治す↓
        getpid=\$(screen -ls | grep \$${input_server_name}_SCREEN_NAME | sed -e 's/[^0-9]//g')
        sed -i -e 's/${input_server_name}_pid="'\$${input_server_name}_pid'"/${input_server_name}_pid="'\$getpid'"/' ./setting.txt
        echo "SCREENNAME: \$${input_server_name}_SCREEN_NAME"
        ;;

    #サーバー停止
    stop)
        spinner_progress_status="プロセスの有無を確認中"
        SPINNER
        while :; do
            if [ "\$(screen -ls | grep \$${input_server_name}_SCREEN_NAME)" == "" ]; then
                if [[ \$retrycount = 1 ]];then
                    echo "サーバーの停止に成功しました。"
                    break
                fi
                echo "サーバーは起動していません"
                break
            else
                . ./setting.txt
                kill \$${input_server_name}_pid
                retrycount="1"
            fi
        done
    ;;
    #サーバーのログ
    log)
        if [ "\$(screen -ls | grep \$${input_server_name}_SCREEN_NAME)" == "" ]; then
            echo "サーバーが起動していません"
        else
            screen -r \$${input_server_name}_SCREEN_NAME
        fi
    ;;
    [sS][tT][aA][tT][uU][sS])
        . ./setting.txt
        if ! kill -0 \$${input_server_name}_BACKUP_PID >/dev/null 2>&1; then
            echo_color_exit="\033[0;39m"
            break
        else
            BACKUP_STATUS="online"
            STATUS_MESSAGE=$(echo -e "| \$${input_server_name}_STATUS | \${echo_color}\$BACKUP_STATUS\${echo_color_exit}")
        fi
        echo "| STATUS | BACKUP_STATUS |"
        ;;
    #設定変更コマンド
    settings)
        . ./setting.txt
        spinner_progress_status="ファイルの確認中"
        SPINNER
        if [[ -e setting.txt ]]; then
        echo "閲覧したい設定を選んでください。"
        echo " 1.サーバー関連 | 2.バックアップ関連"
        echo " 3.WebHook関連  |"
        read -p ">" INPUT_DATA
        case \$INPUT_DATA in
            [1])
                echo "~サーバー設定~"
                echo "1.サーバーのプロセス名"
                echo "└ \$${input_server_name}_SCREEN_NAME"
                echo "2.サーバーJAR名"
                echo "└ \$${input_server_name}_JAVA_HOME"
                echo "3.サーバーメモリ最小"
                echo "└ \$${input_server_name}_MEM_MIN"
                echo "4.サーバーメモリ最大"
                echo "└ \$${input_server_name}_MEM_MAX"
                echo "5.JAVAPATH"
                echo "└ \$${input_server_name}_JAVA_HOME"
                    read INPUT_SERVER_SETTING
                    case \$INPUT_SERVER_SETTING in
                        1)
                            CHANGE_SERVER_PROCESS_NAME
                            ;;
                        2)
                            CHANGE_SERVER_JAR_NAME
                            ;;
                        3)
                            CHANGE_SERVER_MIN_MEMORY
                            ;;
                        4)
                            CHANGE_SERVER_MAX_MEMORY
                            ;;
                        5) ;;

                        *)
                            echo "変なキー打たないで"
                            ;;
                    esac
                ;;
                [2])
                    echo "~バックアップ設定~"
                    echo "1.バックアップ対象"
                    echo "└ \$${input_server_name}_backup_world_name"
                    echo "2.バックアップ先"
                    echo "└ \$${input_server_name}_backup_dir"
                ;;
                [3])
                    . ./setting.txt
                    echo "Slack WebHook"
                    echo "└ \$${input_server_name}_slack_webhook"
                    if [[ \$${input_server_name}_slack_webhook = true ]];then
                        echo "└ \$${input_server_name}_slack_webhook_URL"
                    fi
                    echo "Discord WebHook"
                    echo "└ 1.WebHookのステータス: \$${input_server_name}_discord_webhook"
                    if [[ \$${input_server_name}_discord_webhook = true ]];then
                        echo "└ 2.WebHookの名前: \$${input_server_name}_discord_webhook_name"
                        echo "└ 3.WebHookのアイコン画像: \$${input_server_name}_discord_webhook_avator"
                        echo "└ 4.WebHookURL: \$${input_server_name}_discord_webhook_URL"
                        read -p ">" INPUT_SELECT_DATA
                        case \$INPUT_SELECT_DATA in
                            [1])
                                DISCORD_WEBHOOK_ON_OFF
                            ;;
                            [2])
                                echo "WebHookで使用する名前を入力してください。"
                                read -p ">" INPUT_WEBHOOK_NAME
                                sed -i -e 's/'${input_server_name}_discord_webhook_name'="'\$${input_server_name}_discord_webhook_name'"/'${input_server_name}_discord_webhook_name'="'\$INPUT_WEBHOOK_NAME'"/' ./setting.txt
                                . ./setting.txt
                                if [[ \$INPUT_WEBHOOK_NAME = ${input_server_name}_discord_webhook_name ]];then
                                    echo "変更に成功しました。"
                                else
                                    echo "変更に失敗しました。"
                                fi
                            ;;
                            [3])
                                echo "WebHookで使用するアイコンのURLを入力してください。"
                                read -p ">" INPUT_WEBHOOK_AVATOR
                                sed -i -e 's/'${input_server_name}_discord_webhook_avator'="'\$${input_server_name}_discord_webhook_avator'"/'${input_server_name}_discord_webhook_avator'="'\$INPUT_WEBHOOK_AVATOR'"/' ./setting.txt
                                . ./setting.txt
                                if [[ \$INPUT_WEBHOOK_AVATOR = ${input_server_name}_discord_webhook_avator ]];then
                                    echo "変更に成功しました。"
                                else
                                    echo "変更に失敗しました。"
                                fi
                            ;;
                            [4])
                                echo "WebHook URLを入力してください。"
                                read -p ">" INPUT_WEBHOOK_URL
                                sed -i -e 's/'${input_server_name}_discord_webhook_URL'="'\$${input_server_name}_discord_webhook_URL'"/'${input_server_name}_discord_webhook_URL'="'\$INPUT_WEBHOOK_URL'"/' ./setting.txt
                                sed -i -e 's/'${input_server_name}_discord_webhook_URL'="'\$${input_server_name}_discord_webhook_URL'"/'${input_server_name}_discord_webhook_URL'="'\"$INPUT_WEBHOOK_URL""'"/' ./setting.txt
                                . ./setting.txt
                                if [[ \$INPUT_WEBHOOK_URL = ${input_server_name}_discord_webhook_URL ]];then
                                    echo "変更に成功しました。"
                                else
                                    echo "変更に失敗しました。"
                                fi
                            ;;
                        esac
                    elif [[ \$${input_server_name}_discord_webhook = false ]];then
                        read -p ">" INPUT_SELECT_DATA
                        case \$INPUT_SELECT_DATA in
                            [1])
                                DISCORD_WEBHOOK_ON_OFF
                            ;;
                        esac
                    else
                        echo "設定ファイルが破損しています。"
                    fi
                ;;
            esac
        else
            echo "設定ファイルが存在しません。"
        fi
        ;;
    *) ;;
        #変なキー入力受け付けたとき用
    esac
done
EOF
spinner_progress_status="ファイルの確認中 1/2"
SPINNER
if [[ -e $mc_server_create_file_dir/${input_server_name} ]]; then
    echo "サーバーファイルの作成に成功しました。"
    . usr/lib/intsl_v/server_default_settings.sh
    cd -
    spinner_progress_status="ファイルの確認中 2/2"
    SPINNER
    if [[ ! -e $mc_server_create_file_dir/${input_server_name}/setting.txt ]]; then
        echo "設定ファイルの生成に失敗しました。"
    fi
else
    echo "サーバーファイルの作成に失敗しました。"
    exit 1
fi
NEWSERVERLANE=$((server_add_line + 3))
sed -i -e 's/server_add_line="'$server_add_line'/server_add_line="'$NEWSERVERLANE'/' etc/intsl_v/settings
exit 0
