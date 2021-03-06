FROM solita/ubuntu-systemd:16.04

EXPOSE 22

RUN apt-get update && apt-get install -y openssh-server
RUN rm -rf /etc/ssh/ssh_host*

COPY ssh-host-key.service /etc/systemd/system/
RUN chmod 664 /etc/systemd/system/ssh-host-key.service
RUN systemctl enable ssh-host-key.service

RUN mkdir /root/.ssh && \
  touch /root/.ssh/authorized_keys && \
  chmod 700 /root/.ssh && \
  chmod 600 /root/.ssh/authorized_keys
