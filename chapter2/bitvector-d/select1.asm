bits 64

global select1

select1:
    add rsi, 0xffffffff
    mov rax, 0x1
    shlx rax, rax, rsi
    pdep rax, rax, rdi
    tzcnt rax, rax
    ret
