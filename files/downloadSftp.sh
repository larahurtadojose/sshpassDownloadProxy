#!/bin/bash
#
# Este script requiere sshpass sftp y ncat instalado y configurado primero
#
# Author: Juan Lara
#

usr="$1"
pass="$2"
maquina="$3"
componente="$6"
proxy="$7"
puerto="$8"

export SSHPASS=$pass
sshpass -e sftp -oBatchMode=no -o ConnectTimeout=3 -o ProxyCommand='/usr/bin/ncat --proxy-type http --proxy $7:$8 %h %p' -oPort=22 -b - $usr@$maquina << !
cd $4
get $componente
bye
!
mv $componente $5
