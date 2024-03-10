#!/bin/bash

echo "パスワードマネージャーへようこそ！"

echo "サービス名を入力してください："
read service_name

echo "ユーザー名を入力してください："
read user_name

echo "パスワードを入力してください："
read password

echo "$service_name:$user_name:$password" >> personal_info.txt

echo "Thank you!"