FROM ubuntu:18.04

RUN apt-get update && apt-get install -y curl unzip

# Download and install packer
# Use separately layers for this because downloading is annoying
RUN curl https://releases.hashicorp.com/packer/1.4.3/packer_1.4.3_linux_amd64.zip -o /opt/packer.zip
RUN unzip /opt/packer.zip -d /usr/bin

RUN curl https://omnitruck.chef.io/install.sh | bash -s -- -P inspec
