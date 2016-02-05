# Docker file to build and run consul and consul template
FROM ubuntu:trusty

RUN apt-get update && apt-get install -y sudo openssh-server git
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

RUN mkdir /var/run/sshd

RUN adduser --system --group --shell /bin/sh git
RUN su git -c "mkdir /home/git/bin"
ADD gitadmin.pub /home/git/admin.pub

RUN cd /home/git; su git -c "git clone git://github.com/sitaramc/gitolite"
RUN cd /home/git; su git -c "gitolite/install -ln"
# prevent the perl warning
RUN sed  -i 's/AcceptEnv/# \0/' /etc/ssh/sshd_config

# fix fatal: protocol error: bad line length character: Welc
RUN sed -i 's/session\s\+required\s\+pam_loginuid.so/# \0/' /etc/pam.d/sshd


#ENTRYPOINT ["/usr/sbin/sshd", "-D"]
ADD start.sh /start.sh
RUN chmod a+x /start.sh

EXPOSE 22
CMD ["/start.sh"]
