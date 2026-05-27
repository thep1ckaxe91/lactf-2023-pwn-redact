CXX=g++
CXXFLAGS=-no-pie -fno-stack-protector -g
BUILD_IMAGE=buildpack-deps@sha256:c1a2475ac14e13582cf8a44fc071439132928ada47c57e80af372fdcd1690751
RUN_IMAGE=debian@sha256:98d3b4b0cee264301eb1354e0b549323af2d0633e1c43375d0b25c01826b6790
NAME=redact

.PHONY: clean run build

$(NAME): app/$(NAME).cpp
	docker run --rm -v "$(CURDIR)/app:/app:z" -w /app $(BUILD_IMAGE) $(CXX) $(NAME).cpp $(CXXFLAGS) -o $(NAME)

build: $(NAME)

clean:
	rm app/$(NAME) || true
	docker rmi redact_debug:latest || true

run: build
	docker run --rm -it -v "$(CURDIR)/app:/app:z" -w /app $(RUN_IMAGE) ./$(NAME)

debug_build:
	docker build -t redact_debug:latest -f "$(CURDIR)/app/Dockerfile.debug" app

# --rm for instant remove of container after use
# -it short for interactive
# --cap-add=SYS_PTRACE allow process to have capabilities of manipulating other process with ptrace syscall
# -w working dir
# -v mount volume, with :z means share with host, container can rwx mounted files
debug: build debug_build
	docker run --rm -it --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v "$(CURDIR)/app:/app:z" -w /app redact_debug:latest
