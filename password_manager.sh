#!/bin/bash

echo "パスワードマネージャーへようこそ！"
echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："

read option

case $option in
# Add Password が入力された場合
"Add Password")

    echo "サービス名を入力してください："
    read service_name

    echo "ユーザー名を入力してください："
    read user_name

    echo "パスワードを入力してください："
    read password

    echo "$service_name:$user_name:$password" >> personal_info.txt

    echo "パスワードの追加は成功しました。"
;;
# Get Password が入力された場合
"Get Password")

    echo "サービス名を入力してください："
    read service_name
    
    result=$(grep "$service_name:" personal_info.txt)
    
    if [ -z "$result" ] || [ -z "$service_name" ]; then
        ## サービス名が保存されていなかった場合
        echo "そのサービスは登録されていません。"
    else
    ## サービス名が保存されていた場合
        IFS=: read service_name user_name password <<< "$result"
        echo "サービス名：$service_name" 
        echo "ユーザー名：$user_name"
        echo "パスワード：$password"
    fi
;;
# Add Password/Get Password/Exit 以外が入力された場合
*)
    echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
esac