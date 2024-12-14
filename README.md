# Telegram Bot
За основу был взят [Telegram бот](https://github.com/Artrazr/TelegramBot-PostgreSQL.git) с интегрированной в него базой данных PostgreSQL.

## Конфигурация
Перед работой с приложением необходимо завести ```.env``` файл в директории с проектом. 

Формат файла следующий:
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
Для работы бота потребуется создать бота и получить token у [BotFather](https://telegram.me/BotFather). 

Данный токен нужно указать в файле ```.env```.

## Запуск проекта
После конфигурации достаточно запустить ```docker compose up``` в директории проекта.

В отдельных контейнерах поднимутся postgreSQL, pgAdmin, backend бота.

pgAdmin нужен для администрирования базы данных бота.  
После сборки проекта он становится доступен через localhost по порту ```PGADMIN_HOST_PORT```
(по умолчанию ```localhost:5050```).

Для входа в панель потребуется ```PGADMIN_DEFAULT_PASSWORD```.
