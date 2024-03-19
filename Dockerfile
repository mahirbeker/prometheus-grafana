FROM ubuntu:latest
RUN apt update && apt install -y openssh-client cron vim nano
COPY script.sh /script.sh
COPY crontab.txt /crontab.txt
RUN crontab /crontab.txt
RUN chmod 755 /script.sh
RUN touch process-cron.log && chmod 755 /process-cron.log
CMD ["cron","-f"]
