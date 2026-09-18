GNAT    := gnatmake
SPARK   := spark
FLAGS   := -gnatwa -gnat2022 -gnata -gnat05 -gnatY
OBJ_DIR := obj
BIN_DIR := bin

.PHONY: all test clean prove

all: $(BIN_DIR)/tests

$(BIN_DIR)/tests: *.ads *.adb *.gpr
	mkdir -p $(OBJ_DIR)$(BIN_DIR)
	$(GNAT)$(FLAGS) -Paccumulator.gpr

prove: *.ads *.adb *.gpr
	mkdir -p $(OBJ_DIR)$(SPARK) prove -Paccumulator.gpr --level=4

test: all
	@echo "Running tests..."
	@$(BIN_DIR)/tests

clean:
	rm -rf $(OBJ_DIR)$(BIN_DIR)
