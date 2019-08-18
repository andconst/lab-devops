FROM tiangolo/uwsgi-nginx-flask:python3.7

WORKDIR /app

COPY . .         
RUN pip3 install -r requirements.txt
