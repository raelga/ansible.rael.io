# ansible.rael.io

Ansible playbooks and roles for my computers.

## Usage

Makefile targets:

```make
usage:           Show this help
roles:           Install ansible external roles
check: roles     Check playbooks for all hosts
check-%: roles   Check playbooks for specific hosts: make check-eva.rael.io
run: roles       Run playvooks for all nodes
run-%: roles     Run playbooks for specific hosts: make run-lain.rael.io
```

## Hosts

### Lain
_lain.rael.io_

Home server for network related stuff.

### Eva
_eva.rael.io_

Home file server for backups and media.

### Aloy
_aloy.rael.io_

Music and video workstation.

### Alyx
_alyx.rael.io_

Gaming workstation.

### Ellie
_ellie.rael.io_

Personal computer and main driver.
