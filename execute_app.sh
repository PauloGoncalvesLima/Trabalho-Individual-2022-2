#!/bin/bash

if [ $MODE = "RUN" ]; then
    ${POETRY_HOME}/bin/poetry run python trabalho_individual_gces_2022_paulo/main.py

elif [ $MODE = "TEST" ]; then
    ${POETRY_HOME}/bin/poetry run pytest

elif [ $MODE = "PUBLISH" ]; then
    ${POETRY_HOME}/bin/poetry publish --build --username ${PYPI_USERNAME} --password ${PYPI_PASSWORD}

fi
