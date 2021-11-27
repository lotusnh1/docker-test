#Pull the base image
FROM python:3.7-slim

# who is the maintainer/author of this file
LABEL org.opencontainers.image.authors="PAYALSASMAL, sasmalpayal@gmail.com"

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBUG 0

#upgrading pip for python
RUN python -m pip install --upgrade pip

#install tkinter for my application requirement, you can skip this for your application
RUN apt-get update && apt-get install -y tcl tk

#creating this dir for my application, you can skip this for your application
RUN mkdir -p /usr/share/man/man1

#installing libreoffice for my application, you can skip this for your application
RUN apt-get update && apt-get install -y \
    libreoffice-base default-jre

#copying requirements.txt file
COPY ./requirements.txt /app/requirements.txt

#install those requirements before copying the project
RUN pip install -r /app/requirements.txt

#copy the project
COPY . .

#run gunicorn. here pdfconverter is the project name
CMD gunicorn -b 0.0.0.0:$PORT pdfconverter.wsgi:application


