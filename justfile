_default:
    just --list

build:
    nix build --json --no-link --print-build-logs

cache-build cache_name="altf4llc-os":
    just build \
        | jq -r '.[].outputs | to_entries[].value' \
        | cachix push {{ cache_name }}

cache-inputs cache_name="altf4llc-os":
    nix flake archive --json \
      | jq -r '.path,(.inputs|to_entries[].value.path)' \
      | cachix push "{{ cache_name }}"

cache-shell cache_name="altf4llc-os":
    nix develop --profile "dev-profile" -c true
    cachix push "{{ cache_name }}" "dev-profile"

check:
    nix flake check

docs:
	terraform-docs markdown table \
		--output-file README.md \
		--output-mode inject .

init:
    terraform init

validate:
    terraform validate
