clean:
	@rm -rf .terraform*
dev-apply:	clean ## Create Dev environment
	@terraform init -backend-config=env/dev-backend.tfvars
	@terraform plan -var-file=env/dev.tfvars
#	@terraform apply -auto-approve -var-file=env/dev.tfvars

dev-destroy:	clean ## Destroy DEV environment
	@terraform init -backend-config=env/dev-backend.tfvars
	@terraform destroy -auto-approve -var-file=env/dev.tfvars

prod-apply:	clean ## Create Dev environment
	@terraform init -backend-config=env/prod-backend.tfvars
	@terraform apply -auto-approve -var-file=env/prod.tfvars

prod-destroy:	clean ## Destroy Prod environment
	@terraform init -backend-config=env/prod-backend.tfvars
	@terraform destroy -auto-approve -var-file=env/prod.tfvars
