FROM python:3.8-slim

WORKDIR /app

ADD . .

RUN python3 -m pip install -U pip
RUN pip3 install -r requirements.txt

RUN airflow db init
RUN mkdir ~/airflow/dags
RUN cp -rv src/dev/* ~/airflow/dags/

# unit test
RUN pwd
RUN airflow_test.sh

CMD ["airflow", "dags", "list"]
