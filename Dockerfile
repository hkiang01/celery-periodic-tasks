FROM python:3.7
ENV WORKDIR /app
WORKDIR ${WORKDIR}

COPY requirements.txt ${WORKDIR}/requirements.txt
RUN pip3 install -r requirements.txt
COPY app.py ${WORKDIR}/app.py


CMD celery -A app worker --loglevel=info
