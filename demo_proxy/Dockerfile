FROM registry.access.redhat.com/ubi7/ubi

COPY jbcs-httpd24-httpd-2.4.37-RHEL7-x86_64.zip /tmp/installer.zip

COPY mime.types /etc/

RUN yum update && yum install unzip hostname -y

RUN unzip /tmp/installer.zip 

RUN mv /jbcs-httpd24-2.4/httpd /etc/httpd

WORKDIR /etc/httpd

RUN groupadd -g 48 -r apache

RUN useradd -c "Apache" -u 48 -g apache -s /bin/sh -r apache

RUN chown -R apache:apache /etc/httpd

COPY index.html /var/www/html/index.html

RUN chown -R apache:apache /var/www

RUN rm -rf /run/httpd/* /tmp/httpd* && mkdir -p /var/run/httpd/ && chown -R apache:apache /var/run/httpd

USER apache

RUN cd /etc/httpd && ./.postinstall

RUN mv /etc/httpd/conf.d/ssl.conf /etc/httpd/conf.d/ssl.conf.disabled

COPY sample-httpd.conf /etc/httpd/conf/httpd.conf

EXPOSE 80

EXPOSE 10001

CMD ["/etc/httpd/sbin/apachectl","start", "-D", "FOREGROUND"]