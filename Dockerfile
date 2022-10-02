FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR /code

# ENV VIRTUAL_ENV=/code/env
# RUN python3 -m venv $VIRTUAL_ENV
# ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN python3 -m pip install --upgrade pip
COPY ./requirements.txt /code/requirements.txt
# RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
RUN pip install --upgrade -r /code/requirements.txt

COPY ./apps /code/apps

EXPOSE 8888
CMD ["uvicorn", "apps.main:app", "--host", "0.0.0.0", "--port", "80"]
