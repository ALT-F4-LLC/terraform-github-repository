[private]
default:
  just --list

check:
  nix build --json --no-link --print-build-logs

docs:
	terraform-docs markdown table \
		--output-file README.md \
		--output-mode inject .

fmt:
  terraform fmt -diff -recursive

pr: fmt docs check