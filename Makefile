.PHONY : roles

usage:          ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

roles:          ## Install ansible external roles
	ansible-galaxy role install -r requirements.yml --ignore-errors --roles-path galaxy_roles
	ansible-galaxy collection install -r requirements.yml -p .

check: roles    ## Check playbooks for all hosts
	ansible-playbook site.yml --check --diff ${ANSIBLE_EXTRA_ARGS}

check-%: roles  ## Check playbooks for specific hosts: make check-eva.rael.io
	ansible-playbook site.yml --check --diff --limit $* ${ANSIBLE_EXTRA_ARGS}

run: roles      ## Run playvooks for all nodes
	ansible-playbook site.yml --diff ${ANSIBLE_EXTRA_ARGS}

run-%: roles    ## Run playbooks for specific hosts: make run-lain.rael.io
	ansible-playbook site.yml --diff --limit $* ${ANSIBLE_EXTRA_ARGS}