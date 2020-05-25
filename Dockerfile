FROM python:3-alpine
MAINTAINER lsw0504@obzen.com

# Automatically made at docker-compose volume mounting process 
# RUN mkdir -p /usr/src/app/public \
#             /usr/src/app/view

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/src/app/

EXPOSE 9999
CMD ["python", "app.py"]