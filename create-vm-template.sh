#!/bin/bash

TPL_ID=$1
TPL_MEMORY=$2

function _help_() {
  echo 'Example:'
  echo './create-vm-template.sh [tpl-id] [memory]'
  exit 1
}

if [ -z $1 ]; then
  echo "Please enter the template ID"
  _help_
fi

if [ -z $2 ]; then
  echo "Please enter the memory"
  _help_
fi

qm create $TPL_ID --memory $TPL_MEMORY \
  --net0 virtio,bridge=vmbr0 \
  --scsihw virtio-scsi-pci \
  --scsi0 local-lvm:0,import-from=/var/lib/vz/template/iso/ubuntu-noble-server-cloudimg-amd64.img \
  --ide2 local-lvm:cloudinit \
  --boot order=scsi0 \
  --serial0 socket \
  --vga serial0 \
  --template 1 \
  --agent 1 \
  --cores 2 \
  --sockets 2 \
  --description "my vm template" \
  --name "ubuntu-server-cloud-init-tpl" \
  --cicustom "user=local:snippets/cloud-init.yaml"
