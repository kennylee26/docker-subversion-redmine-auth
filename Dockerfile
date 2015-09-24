# Subversion with redmine auth
#
# VERSION 0.0.1
# Authoer: kennylee26
# NAME: kennylee26/mysql
# Command format: Instruction [arguments command] ..

# 第一行必须指定基于的基础镜像
FROM kennylee26/ubuntu

# 维护者信息
MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN apt-get update && \
    apt-get install -y apache2 subversion perl libdbd-mysql-perl libapache2-mod-perl2 libapache2-svn

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i 's/80/8000/g' /etc/apache2/ports.conf

COPY subversion.conf /etc/apache2/sites-enabled/subversion.conf
COPY Redmine.pm /usr/lib/perl5/Redmine.pm

EXPOSE 8000

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
