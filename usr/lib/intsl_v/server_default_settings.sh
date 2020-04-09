#!/usr/bin/env bash
cryptography=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1 | sort | uniq )

cat <<EOF >$mc_server_create_file_dir/${input_server_name}/setting.txt
#最小メモリ
${INPUT_SERVER_NAME}_MEM_MIN=1G
#最大メモリ
${INPUT_SERVER_NAME}_MEM_MAX=1G
${INPUT_SERVER_NAME}_JVM_ARGUMENT="-Xmx\$${INPUT_SERVER_NAME}_MEM_MAX -Xms\$${INPUT_SERVER_NAME}_MEM_MIN -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -Dusing.aikars.flags=mcflags.emc.gs"
#JAVA
${INPUT_SERVER_NAME}_JAVA_HOME=java
#サーバーJAR名
${INPUT_SERVER_NAME}_FILE_SERVER_FILE="${srce_edision}$mc_donwload_version.jar"
#SCREEN NAME
${INPUT_SERVER_NAME}_SCREEN_NAME="${cryptography}"
#サーバーPID
${INPUT_SERVER_NAME}_pid="none"
#バックアップを行うかどうか
${INPUT_SERVER_NAME}_backup="yes"
#バックアップ先
${INPUT_SERVER_NAME}_backup_dir="./backups"
#バックアップ対象
${INPUT_SERVER_NAME}_backup_world_name="world"
#バックアッププロセスのPID
${INPUT_SERVER_NAME}_BACKUP_PID="none"
#バックアップの間隔
${INPUT_SERVER_NAME}_backup_time="3600"
#サーバーステータス
${INPUT_SERVER_NAME}_STATUS="offline"
#Slack WebHook通知
${INPUT_SERVER_NAME}_slack_webhook="false"
${INPUT_SERVER_NAME}_slack_webhook_URL="none"
#Discord WebHook通知
${INPUT_SERVER_NAME}_discord_webhook="false"
#Discord User Name
${INPUT_SERVER_NAME}_discord_webhook_name=" ${INPUT_SERVER_NAME} STATUS"
#Discord WebHook Avator
${INPUT_SERVER_NAME}_discord_webhook_avator="https://repo.akarinext.org/assets/image/intsl_on_mindustry.png"
#Discord WebHook URL
${INPUT_SERVER_NAME}_discord_webhook_URL="none"
EOF
