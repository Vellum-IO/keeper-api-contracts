# Keeper OpenAPI Specifications

This repository contains OpenAPI 3.0 specifications for the Keeper Database Service API, a DBaaS internal service for provisioning CNPG databases.

## API Specifications

- **openAPI/keeper.openapi.yaml:** Database, Database Credentials, Team and team member management API

## Getting Started

1. Copy the Makefile to your project
2. Run `make download` (or `API_CONTRACTS_VERSION=1.0.2 make download` for a specific version)
3. Commit and push: `git add openapi Makefile && git commit -m "Add Keeper API contracts" && git push`
4. To update later: `make update` (i.e. `API_CONTRACTS_VERSION=1.0.3 make update`) then commit and push

## Usage

Import this repository as a `Git Subtree` and tag a specific version:

```bash
git subtree add \
  --prefix=keeper_api_contracts \
  https://github.com/Vellum-IO/keeper-api-contracts.git \
  main \
  --squash
```

And when an update is needed just execute:

```bash
git subtree pull \
  --prefix=keeper_api_contracts \
  https://github.com/Vellum-IO/keeper-api-contracts.git \
  main \
  --squash
```

You can also replace `main` with a specific `tag`(i.e. 1.0.2) to get the exact version you need.

## License

At the moment no one is allowed to use this commercially.

## Future Improvements

### High Priority

#### Pagination and Filtering

- [x] Add pagination parameters (`page`, `page_size` or `limit`/`offset`) to list endpoints
  - [x] `GET /databases`
  - [x] `GET /teams`
  - [x] `GET /teams/{id}/members`
- [x] Add pagination metadata to list responses (total count, next page, etc.)
- [ ] Add filtering capabilities:
  - `GET /databases` - filter by `status` (PENDING, PROVISIONING, READY, FAILED, DELETING)
  - `GET /databases` - filter/search by `name`
  - `GET /teams/{id}/members` - filter by `role` (owner, member)
- [ ] Add sorting parameters (`sort_by`, `sort_order`) to list endpoints

#### Admin Routes

- [ ] `GET /admin/teams` - List all teams (admin only)
- [ ] `GET /admin/databases` - List all databases across all teams (admin only)
- [ ] `GET /admin/users` - List all users (admin only)
- [ ] `PATCH /admin/teams/{id}/quota` - Update team quotas (admin only)
- [ ] `GET /admin/stats` - System statistics and metrics (admin only)

#### Missing Endpoints and Operations

**Teams:**

- [ ] `PATCH /teams/{id}` - Update team name
- [ ] `DELETE /teams/{id}` - Delete a team (with proper cascade handling)
- [ ] `PATCH /teams/{id}/members/{user_id}` - Update team member role
- [ ] `GET /teams/{id}/quota/usage` - Get current quota usage vs limits

**Databases:**

- [ ] `POST /databases/{id}/credentials/rotate` - Rotate database credentials
- [ ] `POST /databases/{id}/cancel-deletion` - Cancel database deletion if in DELETING state
- [ ] `GET /databases/{id}/events` or `GET /databases/{id}/logs` - Get database events/logs

**System:**

- [ ] `GET /health` - Health check endpoint
- [ ] `GET /version` - API version information

### Medium Priority

- [ ] Add `422 Unprocessable Entity` response for business logic validation errors (quota exceeded, duplicate name, etc.)
- [ ] Add `412 Precondition Failed` response for invalid `If-Match` header in PATCH requests
- [ ] Add `Location` header to `201` responses pointing to created resources
- [ ] Consider `202 Accepted` for async operations with status endpoints
- [ ] Add maximum values to `DatabaseSpec` (e.g., `cpu_millicores: maximum: 100000`)
- [ ] Add rate limiting headers documentation (`X-RateLimit-Limit`, `X-RateLimit-Remaining`, `X-RateLimit-Reset`)
- [ ] Add server URLs to OpenAPI specs (dev, staging, production environments)
- [ ] Add contact information to OpenAPI specs
- [ ] Add examples to all schema properties

### Low Priority

- [ ] Add `Last-Modified` header for caching
- [ ] Add validation for team name uniqueness
- [ ] Add audit trail endpoints
- [ ] Add webhook/notification endpoints for status changes
