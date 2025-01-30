;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0
SYS_READ = 0
SYS_WRITE = 1
SYS_OPEN = 2
SYS_CLOSE = 3
SYS_NANOSLEEP = 35
SYS_EXIT = 60
SYS_KILL = 62
SYS_NEWUNAME = 63
SYS_GETCWD = 79
SYS_MKDIR = 83
SYS_RMDIR = 84
SYS_UNLINK = 87
SYS_SYNC = 162
SYS_TIME = 201
__GETTIME_BUF_LEN = 32

__NEW_UTS_LEN = 64


macro quit {
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall
}
