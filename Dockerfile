FROM python:3.7.2

RUN pip3 install --upgrade setuptools pip wheel

ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH=/code
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

WORKDIR /code
COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . /code

# Run in site-packages so Python distribution is also found when mounted as volume
WORKDIR /usr/local/lib/python3.7/site-packages/
RUN python3 /code/setup.py develop

WORKDIR /code
