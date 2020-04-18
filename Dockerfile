FROM google/cloud-sdk:latest

ARG BRANCH
ENV BRANCH ${BRANCH}
ENV HOME /home/
WORKDIR /home/

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y install hugo

# Use this instead of mounting a volume
COPY ./ /home/

# Set google application environment variable so we can autheticate without issue
ENV GOOGLE_APPLICATION_CREDENTIALS=/home/service-account.json

RUN hugo

RUN gcloud auth activate-service-account auto-deploy@www-stevenhancock.iam.gserviceaccount.com --key-file=$GOOGLE_APPLICATION_CREDENTIALS

RUN if [ "$BRANCH" = "master" ] ; then gsutil -m cp -r public/* gs://www.stevenhancock.ca/ ; else gsutil -m cp -r public/* gs://test.stevenhancock.ca/ ; fi


