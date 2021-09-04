clean:
	@rm -rf .terraform*
dev-apply:	clean ## Create Dev environment
	@terraform init -backend-config=env/dev-providers.tfenv
	@terraform apply -auto-approve -var-file=env/dev.tfenv

dev-destroy:	clean ## Destroy DEV environment
	@terraform init -backend-config=env/dev-providers.tfenv
	@terraform destroy -auto-approve -var-file=env/dev.tfenv

prod-apply:	clean ## Create Dev environment
	@terraform init -backend-config=env/prod-providers.tfenv
	@terraform apply -auto-approve -var-file=env/prod.tfenv

prod-destroy:	clean ## Destroy Prod environment
	@terraform init -backend-config=env/prod-providers.tfenv
	@terraform destroy -auto-approve -var-file=env/prod.tfenv
