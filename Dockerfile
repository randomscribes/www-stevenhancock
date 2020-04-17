FROM google/cloud-sdk:latest

ENV HOME /home/
WORKDIR /home/

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y install hugo

# Use this instead of mounting a volume
COPY ./ /home/

# Set google application environment variable so we can autheticate without issue
ENV GOOGLE_APPLICATION_CREDENTIALS=/home/service-account.json

RUN hugo

RUN gsutil -m cp -r public/* gs://test-stevenhancock/


