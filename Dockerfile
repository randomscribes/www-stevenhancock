FROM google/cloud-sdk:latest

ENV HOME /home/
WORKDIR /home/

RUN apt-get install hugo

# Use this instead of mounting a volume
COPY project /home/

# Set google application environment variable so we can autheticate without issue
ENV GOOGLE_APPLICATION_CREDENTIALS=/home/service-account.json

