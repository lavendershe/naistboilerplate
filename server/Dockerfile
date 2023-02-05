FROM python:3.10-alpine

WORKDIR /app
# COPY requirements.txt /app
# RUN --mount=type=cache,target=/root/.cache/pip \
#     pip3 install -r requirements.txt

COPY . /app
RUN pip3 install -r requirements.txt

EXPOSE 8888

CMD ["python3", "app.py"]