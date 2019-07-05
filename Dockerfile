FROM python:3.6-slim-stretch
RUN apt-get update && \
    apt-get install -y --force-yes openvpn wget unzip curl procps && \
    cd /etc/openvpn && \
    wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip && \
    unzip ovpn.zip && \
    rm ovpn.zip && \
    cd /etc/openvpn/ovpn_tcp/ 
WORKDIR /etc/scripts/
COPY docker_scripts/ ./
RUN pip install requirements.txt
