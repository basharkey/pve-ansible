config:
	cp -i default.config.yml config.yml
	cp -i default.vault.yml vault.yml
vault:
	ansible-vault encrypt vault.yml
install:
	ansible-playbook main.yml -i hosts.yml -e @vault.yml --ask-vault-pass
