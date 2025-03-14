# Используем базовый образ Alpine (легковесный)
FROM alpine:latest

# Устанавливаем Dante и необходимые пакеты
RUN apk add --no-cache dante-server

# Создаем папку для логов
RUN mkdir -p /var/log/sockd && \
    touch /var/log/sockd/sockd.log && \
    chmod -R 777 /var/log/sockd

# Копируем конфигурационный файл Dante
COPY sockd.conf /etc/sockd.conf

# Копируем скрипт для запуска
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Открываем порт для SOCKS5
EXPOSE 1080

# Запускаем прокси
CMD ["/start.sh"]