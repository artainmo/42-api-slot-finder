all:
	@python3 scripts/find_slot.py $(CAMPUS) $(PROJECT)

setup:
	@chmod +x ./scripts/setup.sh
	@chmod +x ./scripts/generate_access_token.sh
	@chmod +x ./scripts/find_project_notation.sh
	@./scripts/setup.sh
	@./scripts/generate_access_token.sh
	
project_notation:
	./scripts/find_project_notation.sh
