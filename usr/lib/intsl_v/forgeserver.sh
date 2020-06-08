#!/usr/bin/env bash
while :; do
    echo "$INPUT_SERVER_VERSION"
    if [[ -z $INPUT_SERVER_VERSION ]]; then
        read -p ">" INPUT_SERVER_VERSION
    fi
    case $INPUT_SERVER_VERSION in
    1.6.1)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.6.1 - 8.9.0.775
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="8.9.0.775"
            mc_server_jar_url="http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.6.1-8.9.0.775/forge-1.6.1-8.9.0.775-installer.jar"
            ;;
        esac
        break
        ;;
    1.6.2)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.6.2 - 9.10.1.871
2│🌟 Stable 1.6.2 - 9.10.1.871
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1 | 2)
            forge_type="latest"
            mc_forge_version="9.10.1.871"
            mc_server_jar_url="http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.6.2-9.10.1.871/forge-1.6.2-9.10.1.871-installer.jar"
            ;;
        esac
        break
        ;;
    1.6.3)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.6.3 - 9.11.0.878
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1 | 2)
            forge_type="latest"
            mc_forge_version="9.11.0.878"
            mc_server_jar_url="http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.6.3-9.11.0.878/forge-1.6.3-9.11.0.878-installer.jar"
            ;;
        esac
        break
        ;;
    1.6.4)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.6.4 - 9.11.1.1345
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1 | 2)
            forge_type="latest"
            mc_forge_version="9.11.1.1345"
            mc_server_jar_url="http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.6.4-9.11.1.965/forge-1.6.4-9.11.1.965-installer.jar"
            ;;
        esac
        break
        ;;
    1.7.2)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.7.2 - 10.12.2.1147
2│🌟 Stable 1.7.2 - 10.12.2.1121
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="10.12.2.1147"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.7.2-10.12.2.1161-mc172/forge-1.7.2-10.12.2.1161-mc172-installer.jar"
            ;;

        2)
            forge_type="stable"
            mc_forge_version="10.12.2.1121"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.7.2-10.12.2.1121/forge-1.7.2-10.12.2.1121-installer.jar"
            ;;
        esac
        break
        ;;
    1.7.10_pre4)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.7.10_pre4 - 10.12.2.1149
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1 | 2)
            forge_type="latest"
            mc_forge_version="10.12.2.1149"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.7.10_pre4-10.12.2.1149-prerelease/forge-1.7.10_pre4-10.12.2.1149-prerelease-installer.jar"
            ;;
        esac
        break
        ;;
    1.7.10)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.7.10 - 10.13.4.1614
2│🌟 Stable 1.7.10 - 10.13.4.1558
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="10.12.2.1147"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/forge-1.7.10-10.13.4.1614-1.7.10-installer.jar"
            ;;

        2)
            forge_type="stable"
            mc_forge_version="10.12.2.1121"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.7.10-10.13.4.1558-1.7.10/forge-1.7.10-10.13.4.1558-1.7.10-installer.jar"
            ;;
        esac
        break
        ;;
    1.8)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.8 - 11.14.4.1577
2│🌟 Stable 1.8 - 11.14.4.1563
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="11.14.4.1577"
            mc_server_jar_url="http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.8-11.14.4.1577/forge-1.8-11.14.4.1577-installer.jar"
            ;;

        2)
            forge_type="stable"
            mc_forge_version="11.14.4.1563"
            mc_server_jar_url="http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.8-11.14.4.1563/forge-1.8-11.14.4.1563-installer.jar"
            ;;
        esac
        break
        ;;
    1.8.8)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.8.8 - 11.15.0.1655
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="11.15.0.1655"
            mc_server_jar_url="http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.8.8-11.15.0.1655/forge-1.8.8-11.15.0.1655-installer.jar"
            ;;
        esac
        break
        ;;
    1.8.9)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.8.9 - 11.15.1.2318
2│🌟 Stable 1.8.9 - 11.15.1.1722
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="11.15.1.2318"
            mc_server_jar_url="http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.8.9-11.15.1.2318-1.8.9/forge-1.8.9-11.15.1.2318-1.8.9-installer.jar"
            ;;

        2)
            forge_type="stable"
            mc_forge_version="11.15.1.1722"
            mc_server_jar_url="http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.8.9-11.15.1.1722/forge-1.8.9-11.15.1.1722-installer.jar"
            ;;
        esac
        break
        ;;
    1.9)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.9 - 12.16.1.1938
2│🌟 Stable 1.9 - 12.16.1.1887
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="12.16.1.1938"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.9-12.16.1.1938-1.9.0/forge-1.9-12.16.1.1938-1.9.0-installer.jar"
            ;;

        2)
            forge_type="stable"
            mc_forge_version="12.16.1.1887"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.9-12.16.1.1887/forge-1.9-12.16.1.1887-installer.jar"
            ;;
        esac
        break
        ;;
    1.9.4)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.9.4 - 12.17.0.2051
2│🌟 Stable 1.9.4 - 12.17.0.1976
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="12.16.1.1938"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.9.4-12.17.0.2051/forge-1.9.4-12.17.0.2051-installer.jar"
            ;;

        2)
            forge_type="stable"
            mc_forge_version="12.16.1.1887"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.9.4-12.17.0.1976/forge-1.9.4-12.17.0.1976-installer.jar"
            ;;
        esac
        break
        ;;

    1.10)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.10 - 12.18.0.2000
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="12.18.0.2000"
            mc_server_jar_url="http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.10-12.18.0.2000-1.10.0/forge-1.10-12.18.0.2000-1.10.0-installer.jar"
            ;;
        esac
        break
        ;;
    1.10.2)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.10.2 - 12.18.3.2511
2│🌟 Stable 1.10.2 - 12.18.3.2185
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="12.18.3.2511"
            mc_server_jar_url="http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.10.2-12.18.3.2511/forge-1.10.2-12.18.3.2511-installer.jar"
            ;;

        2)
            forge_type="stable"
            mc_forge_version="12.18.3.2185"
            mc_server_jar_url="http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.10.2-12.18.3.2185/forge-1.10.2-12.18.3.2185-installer.jar"
            ;;
        esac
        break
        ;;
    1.11)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.11 - 13.19.1.2199
2│🌟 Stable 1.11 - 13.19.1.2189
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="13.19.1.2199"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.11-13.19.1.2199/forge-1.11-13.19.1.2199-installer.jar"
            ;;

        2)
            forge_type="stable"
            mc_forge_version="13.19.1.2189"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.11-13.19.1.2189/forge-1.11-13.19.1.2189-installer.jar"
            ;;
        esac
        break
        ;;
    1.11.2)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.11.2 - 13.20.1.2588
2│🌟 Stable 1.11.2 - 13.20.1.2386
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="13.20.1.2588"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.11.2-13.20.1.2588/forge-1.11.2-13.20.1.2588-installer.jar"
            ;;

        2)
            forge_type="stable"
            mc_forge_version="13.20.1.2386"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.11.2-13.20.1.2386/forge-1.11.2-13.20.1.2386-installer.jar"
            ;;
        esac
        break
        ;;
    1.12)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.12 - 14.21.1.2443
2│🌟 Stable 1.12 - 14.21.1.2387
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="14.21.1.2443"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12-14.21.1.2443/forge-1.12-14.21.1.2443-installer.jar"
            ;;

        2)
            forge_type="stable"
            mc_forge_version="14.21.1.2387"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12-14.21.1.2387/forge-1.12-14.21.1.2387-installer.jar"
            ;;
        esac
        break
        ;;
    1.12.1)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.12.1 - 14.22.1.2485
2│🌟 Stable 1.12.1 - 14.22.1.2478
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="14.22.1.2485"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.1-14.22.1.2485/forge-1.12.1-14.22.1.2485-installer.jar"
            ;;

        2)
            forge_type="stable"
            mc_forge_version="14.22.1.2478"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.1-14.22.1.2478/forge-1.12.1-14.22.1.2478-installer.jar"
            ;;
        esac
        break
        ;;
    1.12.2)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.12.2 - 14.23.5.2854
2│🌟 Stable 1.12.2 - 14.23.5.2854
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1 | 2)
            forge_type="latest"
            mc_forge_version="14.23.5.2854"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2854/forge-1.12.2-14.23.5.2854-installer.jar"
            ;;
        esac
        break
        ;;
    1.13.2)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.13.2 - 25.0.219
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="25.0.219"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.13.2-25.0.219/forge-1.13.2-25.0.219-installer.jar"
            ;;
        esac
        break
        ;;
    1.14.2)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.14.2 - 26.0.63
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="26.0.63"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.14.2-26.0.63/forge-1.14.2-26.0.63-installer.jar"
            ;;
        esac
        break
        ;;
    1.14.3)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.14.3 - 27.0.60
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="27.0.60"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.14.3-27.0.60/forge-1.14.3-27.0.60-installer.jar"
            ;;
        esac
        break
        ;;
    1.14.4)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.14.4 - 28.2.18
2│🌟 Stable 1.14.4 - 28.2.0
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="28.2.18"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.14.4-28.2.18/forge-1.14.4-28.2.18-installer.jar"
            ;;

        2)
            forge_type="stable"
            mc_forge_version="28.2.0"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.14.4-28.2.0/forge-1.14.4-28.2.0-installer.jar"
            ;;
        esac
        break
        ;;
    1.15)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.15 - 29.0.4
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="29.0.4"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.15-29.0.4/forge-1.15-29.0.4-installer.jar"
            ;;
        esac
        break
        ;;
    1.15.1)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.15.1 - 30.0.51
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="30.0.51"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.15.1-30.0.51/forge-1.15.1-30.0.51-installer.jar"
            ;;
        esac
        break
        ;;
    1.15.2)
        minecraft_version="${INPUT_SERVER_VERSION}"
        cat <<EOF
使用するForgeのバージョンを入力してください
1│🐞 Latest 1.15.2 - 31.2.8
2│🌟 Stable 1.15.2 - 31.2.0
EOF
        read -p ">" INPUT_FORGE_VERSION
        case ${INPUT_FORGE_VERSION} in
        1)
            forge_type="latest"
            mc_forge_version="31.2.8"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.15.2-31.2.8/forge-1.15.2-31.2.8-installer.jar"
            ;;

        2)
            forge_type="stable"
            mc_forge_version="31.2.0"
            mc_server_jar_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.15.2-31.2.0/forge-1.15.2-31.2.0-installer.jar"
            ;;
        esac
        break
        ;;

    *)
        echo "存在しないバージョンです"
        read -p ">" INPUT_SERVER_VERSION
        ;;
    esac
done
