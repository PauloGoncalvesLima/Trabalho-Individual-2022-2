FROM python:3.8-bullseye AS app

ENV POETRY_HOME /opt/poetry

# Default mode.
# Modes: RUN, TEST, PUBLISH, DOCS
# RUN: Roda a aplicacao.
# TEST: Executa os testes unitarios da aplicacao.
# PUBLISH: Publica no PyPi o pacote.
# DOCS: Monta e publica a documentacao.
ENV MODE="RUN"

WORKDIR /app

COPY trabalho_individual_gces_2022_paulo trabalho_individual_gces_2022_paulo
COPY tests tests
COPY yamls yamls
COPY pyproject.toml README.md ./

RUN apt-get update && apt-get upgrade -y

RUN python3 -m venv $POETRY_HOME && \
    $POETRY_HOME/bin/pip install poetry==1.3.2 && \
    $POETRY_HOME/bin/poetry --version && \
    ${POETRY_HOME}/bin/poetry install

COPY execute_app.sh ./
RUN chmod 777 execute_app.sh

ENTRYPOINT [ "./execute_app.sh" ]
