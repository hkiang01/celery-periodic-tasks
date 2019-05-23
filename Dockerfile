FROM python:3.7
ENV WORKDIR /app
WORKDIR ${WORKDIR}

COPY requirements.txt ${WORKDIR}/requirements.txt
COPY app.py ${WORKDIR}/app.py
RUN pip3 install -r requirements.txt

CMD celery -A app worker --loglevel=info
