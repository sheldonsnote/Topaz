FROM python:3.6

RUN apt-get update
RUN apt-get install -y build-essential

# Put require here to use cached layers when possible
ADD requirements.txt /tmp/requirements.txt
RUN pip install --trusted-host pypi.python.org -r /tmp/requirements.txt

WORKDIR /app

COPY . /app

EXPOSE 5000

ENV USERNAME "admin"
ENV PASSWORD "test"

CMD ["uwsgi", "--ini", "topaz.ini"]
