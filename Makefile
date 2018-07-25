usage:          ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

roles:          ## Install ansible external roles
	ansible-galaxy install --role-file requirements.yml --roles-path galaxy_roles

check: roles    ## Check playbooks for all hosts
	ansible-playbook site.yml --check --diff

check-%: roles  ## Check playbooks for specific hosts: make check-eva.rael.io
	ansible-playbook site.yml --check --diff --limit $*

run: roles      ## Run playvooks for all nodes
	ansible-playbook site.yml --diff

run-%: roles    ## Run playbooks for specific hosts: make run-lain.rael.io
	ansible-playbook site.yml --diff --limit $*