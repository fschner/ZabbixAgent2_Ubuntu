#!/bin/bash

# Verificação de erro
set -e

echo "-----------------------------------------------------------"
echo "INICIANDO PROCESSO DE INSTALACAO ZABBIX AGENTE2 FOR LINUX!"
echo "-----------------------------------------------------------"

# URL do pacote Zabbix
ZABBIX_PACKAGE_URL="https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-4+ubuntu22.04_all.deb"

# Nome do pacote
ZABBIX_PACKAGE_NAME="zabbix-release_6.0-4+ubuntu22.04_all.deb"

echo "DOWNLOAD AGENT2 ZABBIX"
wget "$ZABBIX_PACKAGE_URL"

echo "EFETUANDO INSTALACAO AGENT2 ZABBIX"
dpkg -i "$ZABBIX_PACKAGE_NAME"

echo "ATUALIZANDO PACOTES"
apt update

echo "EFETUANDO INSTALACAO AGENT2 ZABBIX"
apt install -y zabbix-agent2 zabbix-agent2-plugin-*

echo "MOVENDO ARQUIVO CONFIG ORIGINAL"
mv /etc/zabbix/zabbix_agent2.conf /etc/zabbix/zabbix_agent2.conf_ORIG

echo "COPIANDO CONFIGURACAO AMBIENTE"
cp zabbix_agent2.conf /etc/zabbix/

echo "INICIANDO SERVICO ZABBIX"
systemctl restart zabbix-agent2

echo "HABILITANDO SERVICO ZABBIX"
systemctl enable zabbix-agent2

clear

echo "-----------------------------------------------------------"
echo "PROCESSO DE INSTALACAO REALIZADO COM SUCESSO!"
echo "-----------------------------------------------------------"

