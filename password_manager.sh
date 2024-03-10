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

# Add Password/Get Password/Exit 以外が入力された場合
*)
    echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
esac