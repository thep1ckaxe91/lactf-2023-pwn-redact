# Redact Challenge: Vulnerability Audit & Exploitation Roadmap

## Phase 1: Infrastructure Orchestration [COMPLETE]
- [x] **Orchestration Refinement (Makefile):**
    - [x] Functional containerized build pipeline using `buildpack-deps`.
    - [x] Functional native execution pipeline using `debian:stable-slim`.
    - [x] **Debug Integration:** Implemented `make debug` target with `SYS_PTRACE`, `seccomp=unconfined`, and `Dockerfile.debug`.
- [ ] **Environment Parity Validation:**
    - [ ] Document all `docker run` flags used (`-v`, `-w`, `--cap-add`, `--security-opt`) and their security implications regarding the `nsjail` simulation.

## Phase 2: Architectural Deep-Dive (Verification)
- [ ] **Dynamic Analysis Mastery (GDB):**
    - [ ] Perform manual stack tracing to verify the distance from `_M_local_buf` to the Saved RIP.
    - [ ] Inspect the Procedure Linkage Table (PLT) entry for `getline` and trace the jump into the Global Offset Table (GOT).
- [ ] **Vulnerability Root Cause Analysis (RCA):**
    - [ ] Formally document the `std::string` SSO layout vs. heap-allocation threshold.
    - [ ] Verify the integer underflow behavior using GDB by inspecting the `CMP` instruction operands during the bounds check.

## Phase 3: Clean-Room Reconstruction
- [ ] **Full-Chain Exploit Implementation:**
    - [ ] Finalize `solution/solve.py` to handle both the `libc` leak and the secondary payload injection (ROP or One-Gadget).
    - [ ] Verify the exploit against the networked `socat` service (simulated remote).
- [ ] **Artifact Generation:**
    - [ ] Capture final GDB memory dumps for the audit report.
    - [ ] Execute a "start-to-finish" build and exploit run to ensure 100% reproducibility.

## Phase 4: Final Documentation
- [ ] Finalize the 15-page thesis report.
- [ ] Archive all build logs and exploitation artifacts in `report/`.
