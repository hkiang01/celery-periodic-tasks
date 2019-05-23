import logging
from celery import Celery

app = Celery('tasks', broker='redis://redis:6379')
logger = logging.getLogger(__name__)

@app.task
def my_task():
    logger.info("my_task")

@app.on_after_configure.connect
def setup_periodic_tasks(sender, **kwargs):
    # Calls test('hello') every 10 seconds.
    sender.add_periodic_task(10.0, my_task.s(), name='test every 10')
