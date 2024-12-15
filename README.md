# Telegram Bot
За основу был взят [Telegram бот](https://github.com/Artrazr/TelegramBot-PostgreSQL.git) с интегрированной в него базой данных PostgreSQL.

## Засивисимости

### Установка необходимых пакетов для запуска docker

Для установки docker требуется выполнить шаги, указанные по [ссылке](https://docs.docker.com/engine/install/)

### Настройка групп
Создание новой группы
```
# groupadd docker
```

Добавление пользователя в созданную ранее группу
```
# usermod -aG docker $USER
```

Применение изменений к группе
```
$ newgrp docker
```

Проверка корректности настройки (должна выполняться следующая команда)
```
$ docker run hello-world
```

Подробнее [руководство по настройке](https://docs.docker.com/engine/install/linux-postinstall/)

## Конфигурация

### Создание бота и получение токена

Для создания бота используется [BotFather](https://telegram.me/BotFather).

1. Создать нового бота с использованием `/newbot`
2. Сохранить token для доступа по HTTP API

### Конфигурация `.env` файла 

Для дальнешей работы с приложением необходимо создать `.env` файл в директории с проектом.

Файл должен иметь следующий формат:
```
PORT=5432
HOST=tg_db
TOKEN=...
POSTGRES_DB=docker_tg_db
POSTGRES_USER=docker_tg
POSTGRES_PASSWORD=docker_tg
PGADMIN_DEFAULT_EMAIL=pgadmin@mail.ru
PGADMIN_CONFIG_SERVER_MODE="False"
PGADMIN_DEFAULT_PASSWORD=password
PGADMIN_HOST_PORT=5050
```

Где `TOKEN` — это созданный ранее токен для доступа к боту.

## Запуск проекта

Для запуска бота требуется выполнить следующую команду в директории проекта
```
docker compose up
```

В случае корректной настройки в отдельных контейнерах поднимутся postgreSQL, pgAdmin и backend бота.

## Работа с базой данных через pgAdmin

### Подключение к pgAdmin

Для работы с базой данных проекта требуется открыть pgAdmin в браузере через localhost по порту `PGADMIN_HOST_PORT`
(по умолчанию `localhost:5050`)

Для входа в панель потребуется ```PGADMIN_DEFAULT_PASSWORD```

### Создание сервера

При создании сервера требуется указать имя сервера (любое) во вкладке `Register->Server->General`.

Во вкладке `Register->Server->Connection` требуется указать данные из `.env` файла:
- HOST
- PORT
- POSTGRES_DB
- POSTGRES_USER
- POSTGRES_PASSWORD
