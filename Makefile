EXECUTABLES = rd md pwd touch yes no rm cat uname true false echo exsleep seq arch gettime kill

all: $(EXECUTABLES)
clean:
	rm $(EXECUTABLES)
size:
	@du -cb $(EXECUTABLES) | grep total$

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

true: true.s aceutils.inc
	fasm true.s

false: false.s aceutils.inc
	fasm false.s

echo: echo.s aceutils.inc strlen.inc
	fasm echo.s

exsleep: exsleep.s aceutils.inc atoi.inc
	fasm exsleep.s

seq: seq.s aceutils.inc atoi.inc itoa.inc memset.inc
	fasm seq.s

arch: arch.s aceutils.inc
	fasm arch.s

gettime: gettime.s aceutils.inc itoa.inc
	fasm gettime.s

kill: kill.s aceutils.inc atoi.inc signal.inc
	fasm kill.s
