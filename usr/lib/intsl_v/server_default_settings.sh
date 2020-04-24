#!/usr/bin/env bash
cryptography=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1 | sort | uniq)
cat <<EOF >${mc_server_create_file_dir}/${input_server_name}/setting.txt
#サーバー名
server_name="${input_server_name}"
#最小メモリ
${input_server_name}_mem_min="1G"
#サーバーディレクトリー
server_dir="${mc_server_create_file_dir}/${input_server_name}"
#最大メモリ
${input_server_name}_mem_max="1G"
${input_server_name}_jvm_argument="-Xmx\$${input_server_name}_mem_max -Xms\$${input_server_name}_mem_min -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -Dusing.aikars.flags=mcflags.emc.gs"
#JAVA
${input_server_name}_java_home=java
#サーバーJAR名
${input_server_name}_file_server_file="${mc_server_edition}$mc_donwload_version.jar"
#SCREEN NAME
${input_server_name}_screen_name="${cryptography}"
#サーバーPID
${input_server_name}_pid="none"
#バックアップを行うかどうか
${input_server_name}_backup="yes"
#バックアップ先
${input_server_name}_backup_dir="./backups"
#バックアップ対象
${input_server_name}_backup_world_name="world"
#バックアッププロセスのPID
${input_server_name}_BACKUP_PID="none"
#バックアップの間隔
${input_server_name}_backup_time="3600"
#サーバーステータス
${input_server_name}_STATUS="offline"
#Slack WebHook通知
${input_server_name}_slack_webhook="false"
${input_server_name}_slack_webhook_URL="none"
#Discord WebHook通知
${input_server_name}_discord_webhook="false"
#Discord User Name
${input_server_name}_discord_webhook_name=" ${input_server_name} STATUS"
#Discord WebHook Avator
${input_server_name}_discord_webhook_avator="https://repo.akarinext.org/assets/image/intsl_on_mindustry.png"
#Discord WebHook URL
${input_server_name}_discord_webhook_URL="none"
EOF