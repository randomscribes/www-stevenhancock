FROM google/cloud-sdk:latest

ENV HOME /home/
WORKDIR /home/

RUN test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv) \
    && test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv) \
    && test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile \
    && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

RUN brew install hugo

# Use this instead of mounting a volume
COPY project /home/

# Set google application environment variable so we can autheticate without issue
ENV GOOGLE_APPLICATION_CREDENTIALS=/home/service-account.json

