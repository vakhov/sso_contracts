# Makefile

PROTO_DIR := proto
OUT_DIR := gen/go
PROTOC := protoc
PROTO_FILES := $(shell find $(PROTO_DIR) -name "*.proto")

.PHONY: proto clean

proto:
	@echo "Генерация кода из .proto файлов..."
	@$(PROTOC) -I=$(PROTO_DIR) \
		$(PROTO_FILES) \
		--go_out=$(OUT_DIR) \
		--go-grpc_out=$(OUT_DIR) \
		--go_opt=paths=source_relative \
		--go-grpc_opt=paths=source_relative
	@echo "Код успешно сгенерирован в $(OUT_DIR)."

clean:
	@echo "Очистка сгенерированных файлов..."
	@find $(OUT_DIR) -type f -delete
	@echo "Содержимое $(OUT_DIR) успешно очищено."
