API_CONTRACTS_VERSION ?= main

# On the first add
download:
	git subtree add \
	  --prefix=keeper_api_contracts \
	  https://github.com/Vellum-IO/keeper-api-contracts.git \
	  $(API_CONTRACTS_VERSION) \
	  --squash

# If you bump the version of the api contracts
update:
	git subtree pull \
	  --prefix=keeper_api_contracts \
	  https://github.com/Vellum-IO/keeper-api-contracts.git \
	  $(API_CONTRACTS_VERSION) \
	  --squash


