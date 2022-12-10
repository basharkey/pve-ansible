vault:
	ansible-vault encrypt vault.yml
install:
	ansible-playbook main.yml -i hosts.yml -e @vault.yml --ask-vault-pass --tags install
test:
	ansible-playbook main.yml -i hosts.yml -e @vault.yml --ask-vault-pass --tags test
