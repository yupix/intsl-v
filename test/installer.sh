#!/usr/bin/env bash
#手順書:
#ファイル名を変数でこのファイルに渡す。(file=forge)
#editionを変数に入れて渡す。(edition=forge)

edition="forge"

max_line=$(wc <forge -l)
echo "HIT: ${max_line}行"
echo "使用するMCバージョンを入力してください。"
read  -r -p ">" input_version
for i in $(seq "${max_line}"); do
    get_line=$(sed -n "${i}"p forge)
    get_version=$(echo "${get_line}" | awk '{print $1}')
    echo "DEBUG: version: ${get_version}"
    if [[ "${input_version}" = "${get_version}" ]]; then
        echo "存在します。"
        line_list+="${i} "
    fi
done
if [[ -n "${line_list}" ]]; then
    get_line_number=$(echo "${line_list}" | awk '{print $ARGC -1}')
    for n in $(seq "${get_line_number}"); do
        get_line=$(sed -n "${n}"p forge)
        get_edition=$(echo "${get_line}" | awk '{print $2}')
        if [[ "${edition}" = "${get_edition}" ]];then
            get_line_number=$(echo "${line_list}" | gawk --assign awk_var="$n" '{ print $awk_var }')
            last_line_list+="${get_line_number} "
        fi
    done
fi

if [[ -n "${last_line_list}" ]];then
    for i in ${last_line_list}; do
        get_line=$(sed -n "${i}"p forge)
        get_type=$(echo "${get_line}" | awk '{print $3}')
        get_version=$(echo "${get_line}" | awk '{print $4}')
        get_url=$(echo "${get_line}" | awk '{print $5}')
        echo "${input_version} ${get_version} ${get_type} ${get_url}"
    done
fi