#!/usr/bin/env bash
set -x

logger() {
  DT=$(date '+%Y/%m/%d %H:%M:%S')
  FILENAME="install-vault-systemd.sh"
  echo "$DT $FILENAME: $1"
}

logger "Running"

# Detect package management system.
YUM=$(which yum 2>/dev/null)
APT_GET=$(which apt-get 2>/dev/null)

if [[ ! -z ${YUM} ]]; then
  SYSTEMD_DIR="/etc/systemd/system"
  logger "Installing systemd services for RHEL/CentOS"
  sudo cp /tmp/vault/init/systemd/vault.service ${SYSTEMD_DIR}
  sudo cp /tmp/consul/init/systemd/consul-online.service ${SYSTEMD_DIR}
  sudo cp /tmp/consul/init/systemd/consul-online.target ${SYSTEMD_DIR}
  sudo cp /tmp/consul/init/systemd/consul-online.sh /usr/bin/consul-online.sh
  sudo chmod 0664 ${SYSTEMD_DIR}/{vault*,consul*}
elif [[ ! -z ${APT_GET} ]]; then
  SYSTEMD_DIR="/lib/systemd/system"
  logger "Installing systemd services for Debian/Ubuntu"
  sudo cp /tmp/vault/init/systemd/vault.service ${SYSTEMD_DIR}
  sudo cp /tmp/consul/init/systemd/consul-online.service ${SYSTEMD_DIR}
  sudo cp /tmp/consul/init/systemd/consul-online.target ${SYSTEMD_DIR}
  sudo cp /tmp/consul/init/systemd/consul-online.sh /usr/bin/consul-online.sh
  sudo chmod 0664 ${SYSTEMD_DIR}/{vault*,consul*}
else
  logger "OS Detection failed, ${USER} user not created."
  exit 1;
fi

#logger "Enabling and starting consul"
#sudo systemctl enable consul
#sudo systemctl start consul

#logger "Enabling and starting vault"
#sudo systemctl enable vault
#sudo systemctl start vault

logger "Complete"