include .env
LOCAL_BIN:=$(CURDIR)/bin

install-deps:
	go install github.com/pressly/goose/v3/cmd/goose@v3.14.0
	if not exist "$(LOCAL_BIN)" mkdir "$(LOCAL_BIN)"
	move "$(GOPATH)\bin\goose.exe" "$(LOCAL_BIN)\goose.exe"

local-migration-status:
	goose.exe -dir ./migrations postgres "host=localhost port=5432 dbname=note user=note-user password=note-password sslmode=disable" status -v

local-migration-up:
	goose.exe -dir $(MIGRATION_DIR) postgres $(PG_DSN) up -v

local-migration-down:
	goose.exe -dir $(MIGRATION_DIR) postgres $(PG_DSN) down -v