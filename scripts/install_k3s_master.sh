#!/usr/bin/env bash
#
# Instalando k3s en Ubuntu 20.04 - MASTER NODE
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
sudo cat /vagrant/to_append_to_hosts >> /etc/hosts
IP_MASTER=$(grep master /etc/hosts | awk '{print $1}')
flags="--tls-san ${IP_MASTER} --node-external-ip ${IP_MASTER}"
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="${flags}" K3S_NODE_NAME="${HOSTNAME}" K3S_KUBECONFIG_MODE="644" sh -s - --docker
assert "${?} -eq 0" ${LINENO}
sudo cat /var/lib/rancher/k3s/server/node-token > /vagrant/node-token
