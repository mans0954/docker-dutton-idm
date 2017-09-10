FROM debian
MAINTAINER christopher.hoskin@gmail.com

RUN apt-get update && apt-get install -y puppet librarian-puppet iptables git

ADD common.yaml /etc/puppet/code/hiera/common.yaml
ADD site.pp /etc/puppet/manifests/site.pp 
ADD Puppetfile /usr/share/puppet/Puppetfile

WORKDIR /usr/share/puppet/
RUN librarian-puppet install
#RUN puppet apply /etc/puppet/manifests/site.pp


