clean:
	@rm -rf .terraform*
dev-apply:	clean ## Create Dev environment
	@terraform init -backend-config=vars/vars/dev-backend.tfvars
	@terraform plan -var-file=dev.tfvars
#	@terraform apply -auto-approve -var-file=vars/dev.tfvars

dev-destroy:	clean ## Destroy DEV environment
	@terraform init -backend-config=vars/dev-backend.tfvars
	@terraform destroy -auto-approve -var-file=vars/dev.tfvars

prod-apply:	clean ## Create Dev environment
	@terraform init -backend-config=vars/prod-backend.tfvars
	@terraform apply -auto-approve -var-file=vars/prod.tfvars

prod-destroy:	clean ## Destroy Prod environment
	@terraform init -backend-config=vars/prod-backend.tfvars
	@terraform destroy -auto-approve -var-file=vars/prod.tfvars
