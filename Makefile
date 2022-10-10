# Find all .proto files.
PROTO_FILES := $(wildcard proto/opensergo/*/*/*.proto)
PROTO_ROOT_DIR := ./proto

PROTOC := ./protoc-gen/lib/protoc/bin/protoc

# Function to execute a command. Note the empty line before endef to make sure each command
# gets executed separately instead of concatenated with previous one.
# Accepts command to execute as first parameter.
define exec-command
$(1)

endef

PROTO_GEN_GO_DIR ?= stub-go/opensergo-protocol-grpc-go
# Generate gRPC/Protobuf implementation for Go.
.PHONY: gen-go
gen-go: clean-go
	mkdir -p ./$(PROTO_GEN_GO_DIR)
	$(foreach file, $(PROTO_FILES), $(call exec-command, $(PROTOC) \
	  --proto_path=$(PROTO_ROOT_DIR) \
	  --go_out=./$(PROTO_GEN_GO_DIR) \
	  --go-grpc_out=./$(PROTO_GEN_GO_DIR) \
	  --validate_out="lang=go:./$(PROTO_GEN_GO_DIR)" \
	  $(file)))
	mv $(PROTO_GEN_GO_DIR)/github.com/jnan806/opensergo-protocol-grpc-go/* $(PROTO_GEN_GO_DIR)/
	rm -rf $(PROTO_GEN_GO_DIR)/github.com
	cp stub-go/go.mod $(PROTO_GEN_GO_DIR)/
	cp stub-go/.gitignore $(PROTO_GEN_GO_DIR)/
	cp -r ./proto $(PROTO_GEN_GO_DIR)/protofile

.PHONY: clean-go
clean-go:
	rm -rf ./$(PROTO_GEN_GO_DIR)


PROTO_GEN_JAVA_DIR ?= stub-java/opensergo-protocol-grpc-java
# Generate gRPC/Protobuf implementation for Java.
.PHONY: gen-java
gen-java: clean-java
	mkdir -p ./$(PROTO_GEN_JAVA_DIR)/src/main/java
	$(foreach file, $(PROTO_FILES), $(call exec-command, $(PROTOC) \
	  --proto_path=$(PROTO_ROOT_DIR) \
	  --java_out=./$(PROTO_GEN_JAVA_DIR)/src/main/java \
	  --grpc-java_out=./$(PROTO_GEN_JAVA_DIR)/src/main/java \
	  --validate_out="lang=java:./$(PROTO_GEN_JAVA_DIR)/src/main/java" \
	  $(file)))
	cp stub-java/pom.xml $(PROTO_GEN_JAVA_DIR)/
	cp -r ./proto $(PROTO_GEN_JAVA_DIR)/src/main/protofile

.PHONY: clean-java
clean-java:
	rm -rf ./$(PROTO_GEN_JAVA_DIR)


.PHONY: gen-all
gen-all: gen-go gen-java


.PHONY: clean-all
clean-all: clean-go clean-java
