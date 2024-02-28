check:
  nix build --json --no-link --print-build-logs

docs:
	terraform-docs markdown table \
		--output-file README.md \
		--output-mode inject .

init:
    terraform init

validate:
    terraform validate
