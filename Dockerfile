##out base image
FROM alpine:3.5

# Install python and pip
RUN apk add --update py2-pip
WORKDIR /usr/src/app

# Install python modules needed by the python app
COPY requirements.txt .
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# copy files required for the app to run
COPY app.py .
COPY templates/index.html ./templates/

# tell the port number the container should expose
EXPOSE 3000

# run the application
CMD ["python", "./app.py"]
