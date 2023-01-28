FROM python:3.8-bullseye

ENV POETRY_HOME /opt/poetry

# Default mode.
# Modes: RUN, TEST, PUBLISH
# RUN: Roda a aplicacao.
# TEST: Executa os testes unitarios da aplicacao.
# PUBLISH: Publica no PyPi o pacote.
ENV MODE="RUN"

WORKDIR /app

COPY trabalho_individual_gces_2022_paulo trabalho_individual_gces_2022_paulo
COPY tests tests
COPY yamls yamls
COPY pyproject.toml README.md execute_app.sh ./

RUN chmod 777 execute_app.sh && \
    python3 -m venv $POETRY_HOME && \
    $POETRY_HOME/bin/pip install poetry==1.3.2 && \
    $POETRY_HOME/bin/poetry --version && \
    ${POETRY_HOME}/bin/poetry install

ENTRYPOINT [ "./execute_app.sh" ]