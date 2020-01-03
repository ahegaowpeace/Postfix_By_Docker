FROM centos:7

# update
RUN yum -y update && yum clean all

# set locale
RUN yum reinstall -y glibc-common && yum clean all
ENV LANG ja_JP.UTR-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTR-8
RUN unlink /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime

# editor install
RUN yum install -y vim && yum clean all

# Postfix install
RUN yum install -y postfix
RUN yum install -y cyrus-sasl cyrus-sasl-plain
RUN yum install -y mailx
RUN yum install -y telnet

# copy config files AND replace config
COPY files/main.cf.org /etc/postfix/main.cf.org
COPY init/sed.sh /etc/postfix/sed.sh
COPY files/sasl_passwd /etc/postfix/sasl_passwd
WORKDIR /etc/postfix
RUN /bin/bash sed.sh

# Create DB
RUN /usr/sbin/postmap /etc/postfix/sasl_passwd
RUN chmod 600 /etc/postfix/sasl_passwd.db
