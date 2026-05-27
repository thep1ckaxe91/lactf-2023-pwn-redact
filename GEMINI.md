# Project Overview: redact-lactf

`redact` is a C++ pwn challenge originally featured in LA CTF 2023. The project consists of a "flag redactor" utility designed to demonstrate a vulnerability involving `std::string` manipulation and integer underflow.

## Project Structure
- `app/`: Contains the challenge source code (`redact.cpp`), the binary (`redact`), and environment configuration (`flag.txt`, `Dockerfile.debug`).
- `solution/`: Contains exploitation scripts (`solve.py`, `solve_original.py`) and the required `libc.so.6` library for environment parity.
- `docs/`: Project documentation and task tracking (`TODO.md`).
- `report/`: Generated audit reports and screenshots for the thesis.

## Technologies
- **Language:** C++
- **Build System:** Makefile (using Podman/Docker for reproducible builds)
- **Containerization:** Docker (pwn.red/jail simulation)
- **Exploitation:** Python with `pwntools`

## Architecture
The application reads a base text and a placeholder from the user. It then takes an index and attempts to copy the placeholder into the base text at that index using `std::copy`.

The core vulnerability is an integer underflow in the bounds check:
```cpp
if (index < 0 || index > text.size() - placeholder.size()) {
    std::cout << "Invalid index\n";
    return 1;
}
```
Since `std::string::size()` returns an unsigned type (`size_t`), providing a `placeholder` larger than `text` causes the subtraction to underflow, resulting in a very large positive value.

## Building and Running

### Build the challenge binary
```bash
make build
```

### Run the challenge locally (Direct)
```bash
make run
```

### Run the challenge as a Network Service
To simulate the CTF environment (remote-like behavior), you can use `socat` to serve the binary over TCP:
```bash
socat TCP-LISTEN:1337,reuseaddr,fork EXEC:"docker run --rm -i -v $(pwd)/app:/app:z -w /app debian:stable-slim ./redact",pty,stderr
```

### Run the exploit
```bash
cd solution && python3 solve.py
```
Note: Ensure `solve.py` is configured to target the correct binary path and remote/local host as needed.

## Development Conventions

### Compilation Flags
- `-no-pie`: Disables Position Independent Executable.
- `-fno-stack-protector`: Disables stack canaries.

### Environment
The production environment uses `pwn.red/jail`. The specific `libc.so.6` in `solution/` must be used to calculate offsets for ROP chains and One-Gadgets.
