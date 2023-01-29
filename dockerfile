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

RUN python3 -m venv $POETRY_HOME && \
    $POETRY_HOME/bin/pip install poetry==1.3.2 && \
    $POETRY_HOME/bin/poetry --version && \
    ${POETRY_HOME}/bin/poetry install

RUN pip3 install Sphinx==6.1.3

COPY execute_app.sh ./
RUN chmod 777 execute_app.sh

VOLUME [ "/docs" ]

RUN sphinx-quickstart /docs --sep --project 'Trabalho GCES 2022.2' --author 'Paulo Gonçalves Lima' -r trabalho_individual_gces_2022_paulo -l en

RUN cd /docs/ && cat Makefile

ENTRYPOINT [ "./execute_app.sh" ]
