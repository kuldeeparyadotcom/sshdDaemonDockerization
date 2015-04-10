FROM ubuntu:14.04
MAINTAINER kd <kuldeeparyadotcom@gmail.com>
RUN apt-get update
RUN apt-get install -y openssh-server
RUN cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original
RUN chmod a-w /etc/ssh/sshd_config.original
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
CMD ["/usr/sbin/sshd", "-D"]
EXPOSE 22
