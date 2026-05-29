_default:
    just --list

check:
    terraform fmt -check -recursive
    terraform init -backend=false
    terraform validate

docs:
	terraform-docs markdown table \
		--output-file README.md \
		--output-mode inject .

fmt:
    terraform fmt -recursive

init:
    terraform init

validate:
    terraform validate
