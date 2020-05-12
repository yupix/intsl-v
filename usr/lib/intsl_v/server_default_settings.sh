#!/usr/bin/env bash
cryptography=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1 | sort | uniq)
cat <<EOF >${mc_server_create_file_dir}/${input_server_name}/setting.txt
#サーバー名
server_name="${input_server_name}"
#最大メモリ
mc_run_server_mem_max="1G"
#最小メモリ
mc_run_server_mem_min="1G"
#サーバーディレクトリー
server_dir="${mc_server_create_file_dir}/\${server_name}"
mc_run_server_jvm_argument="-Xmx\${mc_run_server_mem_max} -Xms\${mc_run_server_mem_min} -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -Dusing.aikars.flags=mcflags.emc.gs"
#JAVA
mc_run_server_java_home=java
#サーバーJAR名
mc_run_server_file_server_file="${mc_server_edition}$mc_donwload_version.jar"
#SCREEN NAME
mc_run_server_screen_name="${cryptography}"
#サーバーPID
mc_run_server_pid="none"
#バックアップを行うかどうか
mc_run_server_backup="yes"
#バックアップ先
mc_run_server_backup_dir="./backups"
#バックアップ対象
mc_run_server_backup_world_name="world"
#バックアッププロセスのPID
mc_run_server_BACKUP_PID="none"
#バックアップの間隔
mc_run_server_backup_time="3600"
#サーバーステータス
mc_run_server_status="offline"
#Slack WebHook通知
mc_run_server_slack_webhook="false"
mc_run_server_slack_webhook_URL="none"
#Discord WebHook通知
mc_run_server_discord_webhook="false"
#Discord User Name
mc_run_server_discord_webhook_name=" ${mc_run_server} Server"
#Discord WebHook Avator
mc_run_server_discord_webhook_avator="https://repo.akarinext.org/assets/image/intsl_on_mindustry.png"
#Discord WebHook URL
mc_run_server_discord_webhook_URL="none"
EOF
