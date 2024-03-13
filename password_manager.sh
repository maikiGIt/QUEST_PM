#!/bin/bash

echo "パスワードマネージャーへようこそ！"

while true
do

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
        
        #暗号化して上書き
        gpg -c -o personal_info.gpg personal_info.txt
        #元ファイルの削除
        rm personal_info.txt
    ;;
    # Get Password が入力された場合
    "Get Password")

        echo "サービス名を入力してください："
        read service_name
    
        result=$(gpg -d personal_info.gpg | grep "$service_name:")
    
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
    # Exit が入力された場合
    "Exit")

        echo Thank you!
        break
    ## プログラムが終了
    ;;
    # Add Password/Get Password/Exit 以外が入力された場合
    *)
        echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
    esac
done