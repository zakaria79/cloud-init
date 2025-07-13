# cloud init

## cloud-init.yaml file

create cloud-init.yaml file in `/var/lib/vz/snippets/cloud-init.yaml`

## create vm template

```
./create-vm-template.sh 9000 4096
```

## create vm

```
./create-vm.sh 9000 200 nas 4096 192.168.2.200/24 192.168.2.1 30G
```
