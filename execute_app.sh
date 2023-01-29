#!/bin/bash

if [ $MODE = "RUN" ]; then
    ${POETRY_HOME}/bin/poetry run python trabalho_individual_gces_2022_paulo/main.py
elif [ $MODE = "TEST" ]; then
    ${POETRY_HOME}/bin/poetry run pytest
elif [ $MODE = "PUBLISH" ]; then
    ${POETRY_HOME}/bin/poetry publish --build --username "__token__" --password "${PYPI_PASSWORD}"
elif [ $MODE = "DOCS" ]; then
    ${POETRY_HOME}/bin/poetry version
fi
