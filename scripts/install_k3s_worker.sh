#!/usr/bin/env bash
#
# Instalando k3s en Ubuntu 20.04 - WORKER NODE
#
# URL: https://computingforgeeks.com/install-kubernetes-on-ubuntu-using-k3s/
#
# Author: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2022-06-25
#
prepare_hosts_file() {
  HOST_FILE="/etc/hosts"
  # se remueven todos los saltos de linea y luego se elimina la ultima linea
  sed -i '/^$/d' ${HOST_FILE} && sed -i '$d' ${HOST_FILE}
}
if [ ${UID} -ne 0 ]; then
  echo "Run this script as root"
  exit 1
fi
source /vagrant/scripts/util.sh
prepare_hosts_file
cat /vagrant/to_append_to_hosts >> /etc/hosts
IP_MASTER=$(grep master /etc/hosts | awk '{print $1}')
NODE_TOKEN=$(cat /vagrant/node-token)
echo "Master IP ${IP_MASTER}"
echo "Node token ${NODE_TOKEN}"
curl -sfL https://get.k3s.io | K3S_URL="https://${IP_MASTER}:6443" K3S_TOKEN="${NODE_TOKEN}" sh -s - --docker
assert "${?} -eq 0" ${LINENO}
