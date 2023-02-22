all:
	@python3 scripts/find_slots.py
setup:
	@chmod +x ./scripts/setup.sh
	@chmod +x ./scripts/generate_access_token.sh
	@chmod +x ./scripts/find_slots.sh
	@chmod +x ./scripts/find_project_notation.sh
	@export API42_ACCESS_TOKEN=3
	@./scripts/setup.sh
	@./scripts/generate_access_token.sh
	
project_notation:
	./scripts/find_project_notation.sh
