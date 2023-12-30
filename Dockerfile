FROM ubuntu:22.04

RUN apt-get update && \
    apt update && \
    apt upgrade && \
    apt install -y python2 wget curl unrar nodejs npm

RUN wget https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py -O /bin/systemctl && \
    chmod a+x /bin/systemctl && \
    curl -Lk 'https://zyzmu-my.sharepoint.com/personal/pcw_zyzmu_onmicrosoft_com/_layouts/15/download.aspx?UniqueId=d49af491%2D51ac%2D444d%2D9189%2D5289331cc9de' --output yolo.rar && \
    unrar yolo.rar && \
    npm install -g @vue/cli && \
    cd yolo/frontend
    
WORKDIR /root/yolo/frontend

EXPOSE 8080

CMD ["npm", "run", "serve"]
