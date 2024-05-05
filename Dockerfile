# Docker-команда FROM вказує базовий образ контейнера
FROM python:3.12

LABEL authors="rehina"
# Встановимо змінну середовища
ENV APP_HOME /app

# Встановимо робочу директорію всередині контейнера
WORKDIR $APP_HOME


COPY poetry.lock $APP_HOME/poetry.lock
COPY pyproject.toml $APP_HOME/pyproject.toml

# Скопіюємо інші файли в робочу директорію контейнера
COPY . .

# Встановимо залежності всередині контейнера
RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install --only main

# Позначимо порт, де працює застосунок всередині контейнера
EXPOSE 5000

# Запустимо наш застосунок всередині контейнера
CMD ["python", "main.py", "exit"]
