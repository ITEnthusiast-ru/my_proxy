# SOCKS5-прокси на Docker

Этот проект предоставляет простой SOCKS5-прокси сервер на основе Dante, работающий внутри Docker-контейнера. Прокси поддерживает аутентификацию по логину и паролю, а также IPv6.

## Особенности

- **Аутентификация**: Для подключения требуется логин и пароль.
- **Поддержка IPv6**: Работает как с IPv4, так и с IPv6.
- **Логирование**: Логи сохраняются в файл `/var/log/sockd/sockd.log` внутри контейнера.

## Требования

- Установленный Docker на вашей системе.

## Использование

### 1. Клонируйте репозиторий

```bash
git clone https://github.com/yourusername/socks5-proxy.git
cd socks5-proxy
```

### 2. Соберите Docker-образ

```bash
docker build -t socks5-proxy .
```

### 3. Запустите контейнер

Замените `your_username` и `your_password` на желаемые логин и пароль.

```bash
docker run -d \
  --name socks5-proxy \
  -p 1080:1080 \
  -e PROXY_USER=your_username \
  -e PROXY_PASSWORD=your_password \
  socks5-proxy
```

### Подключитесь к прокси

- **IP** : IP-адрес вашего сервера.
- **Порт** : `1080`
- **Логин** : `your_username`
- **Пароль** : `your_password`

#### Пример использования с `curl`:

```bash
curl --socks5 your_username:your_password@your_server_ip:1080 http://example.com
```

### 5. Просмотр логов

Чтобы просмотреть логи, выполните:

```bash
docker logs socks5-proxy
```

## Настройка

Вы можете настроить прокси, отредактировав файл `sockd.conf`.

## Лицензия

Этот проект распространяется под лицензией MIT. Подробнее см. в файле [LICENSE](https://license/).
