FROM jupyter/scipy-notebook@sha256:fca4bcc9cbd49d9a15e0e4df6c666adf17776c950da9fa94a4f0a045d5c4ad33

USER root

RUN TEMP_DEB="$(mktemp)" \
    && wget --no-check-certificate -O "$TEMP_DEB" "https://github.com/quarto-dev/quarto-cli/releases/download/v1.5.54/quarto-1.5.54-linux-amd64.deb" \
    && dpkg -i "$TEMP_DEB" \
    && rm -f "$TEMP_DEB"

USER ${NB_UID}

RUN pip install poetry==1.8.2 \
    && poetry config virtualenvs.create false

COPY poetry.lock pyproject.toml ./work/

RUN cd work \
    && poetry install --no-interaction \
    && rm poetry.lock pyproject.toml
