EXECUTABLES = rd md pwd touch yes no rm cat uname

all: $(EXECUTABLES)
clean:
	rm $(EXECUTABLES)

md: md.s aceutils.inc
	fasm md.s

rd: rd.s aceutils.inc
	fasm rd.s

pwd: pwd.s aceutils.inc
	fasm pwd.s

touch: touch.s aceutils.inc
	fasm touch.s

yes: yes.s aceutils.inc
	fasm yes.s

no: no.s aceutils.inc
	fasm no.s

rm: rm.s aceutils.inc
	fasm rm.s

cat: cat.s aceutils.inc
	fasm cat.s

uname: uname.s aceutils.inc
	fasm uname.s
