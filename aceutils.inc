SYS_WRITE = 1
SYS_OPEN = 2
SYS_CLOSE = 3
SYS_EXIT = 60
SYS_GETCWD = 79
SYS_MKDIR = 83
SYS_RMDIR = 84
SYS_UNLINK = 87

macro quit {
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall
}
