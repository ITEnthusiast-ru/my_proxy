#!/bin/sh

# Проверяем, заданы ли переменные окружения для логина и пароля
if [ -z "$PROXY_USER" ] || [ -z "$PROXY_PASSWORD" ]; then
  echo "Please set PROXY_USER and PROXY_PASSWORD environment variables."
  exit 1
fi

# Создаем пользователя
adduser -D -g '' "$PROXY_USER"
echo "$PROXY_USER:$PROXY_PASSWORD" | chpasswd

# Запускаем Dante
exec sockd -f /etc/sockd.conf


