PLANFILE = migrate.plan

.PHONY: init plan apply destroy fmt lint clean

init .terraform:  # Inicia Terraform
	terraform init

plan $(PLANFILE): .terraform  # Monta plano de migração
	terraform plan -out $(PLANFILE)

apply: $(PLANFILE)  # Executa plano de migração
	terraform apply $<
	rm -rf $<

destroy: .terraform  # Remove os recursos criados pelo Terraform
	terraform apply -destroy -auto-approve

fmt:  # Formata o código Terraform
	terraform fmt -recursive .

lint:  # Verifica o código Terraform
	terraform fmt -recursive -check -diff .
	terraform validate

clean:  # Excluir arquivos
	rm -rf .terraform *.tfstate *.tfstate.backup .terraform.tfstate.lock.info migrate.plan
