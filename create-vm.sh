#!/bin/bash

TPL_ID=$1
VM_ID=$2
VM_NAME=$3
VM_MEMORY=$4
VM_CIDR=$5
VM_GW=$6
VM_DISK_SIZE=$7

function _help_() {
  echo 'Example:'
  echo './create-vm-template.sh [tpl-id] [vm-id] [vm-name] [memory] [cidr] [gateway] [disk-size]'
  exit 1
}

if [ -z $1 ]; then
  echo "Please enter the template ID"
  _help_
fi
if [ -z $2 ]; then
  echo "Please enter the vm ID"
  _help_
fi
if [ -z $3 ]; then
  echo "Please enter the vm name"
  _help_
fi
if [ -z $4 ]; then
  echo "Please enter the vm memory"
  _help_
fi
if [ -z $5 ]; then
  echo "Please enter the vm cidr (192.168.2.200/24)"
  _help_
fi
if [ -z $6 ]; then
  echo "Please enter the gateway"
  _help_
fi

if [ -z $7 ]; then
  echo "Please enter the disk size"
  _help_
fi

qm clone $TPL_ID $VM_ID --name $VM_NAME
qm set $VM_ID --ipconfig0 ip=$VM_CIDR,gw=$VM_GW
qm set $VM_ID --memory $VM_MEMORY
qm disk resize $VM_ID scsi0 $VM_DISK_SIZE
