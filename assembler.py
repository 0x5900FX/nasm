from pwn import * 
import sys,os,stat


context(os="linux",arch="amd64",log_level="error",)


ELF.from_bytes(unhex(sys.argv[1])).save(sys.argv[2])
os.chmod(sys.argv[2],stat.S_IEXEC)
