clean:
	@rm -rf .terraform*
dev-apply:	clean ## Create Dev environment
	@terraform init -backend-config=dev-backend.tfvars
#	@terraform plan -var-file=dev.tfvars
	@terraform apply -auto-approve -var-file=dev.tfvars

dev-destroy:	clean ## Destroy DEV environment
	@terraform init -backend-config=dev-backend.tfvars
	@terraform destroy -auto-approve -var-file=dev.tfvars

prod-apply:	clean ## Create Dev environment
	@terraform init -backend-config=prod-backend.tfvars
	@terraform apply -auto-approve -var-file=prod.tfvars

prod-destroy:	clean ## Destroy Prod environment
	@terraform init -backend-config=prod-backend.tfvars
	@terraform destroy -auto-approve -var-file=prod.tfvars
