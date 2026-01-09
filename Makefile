API_CONTRACTS_VERSION ?="main"

# On the first add
download:
	git subtree add \
	  --prefix=openapi \
	  https://github.com/Vellum-IO/keeper-openapi-specs.git \
	  $(API_CONTRACTS_VERSION) \
	  --squash

# If you bumb the version of the api contracts
update:
	git subtree pull \
	  --prefix=openapi \
	  https://github.com/Vellum-IO/keeper-openapi-specs.git \
	  $(API_CONTRACTS_VERSION) \
	  --squash


