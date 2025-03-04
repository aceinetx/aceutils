#include "_rebuild/rebuild.h"

int main(int argc, char **argv) {
  rebuild_targets.push_back(
      new Target("md", {"md.s", "aceutils.inc"}, "fasm md.s"));
  rebuild_targets.push_back(
      new Target("rd", {"rd.s", "aceutils.inc"}, "fasm rd.s"));
  rebuild_targets.push_back(
      new Target("pwd", {"pwd.s", "aceutils.inc"}, "fasm pwd.s"));
  rebuild_targets.push_back(
      new Target("touch", {"touch.s", "aceutils.inc"}, "fasm touch.s"));
  rebuild_targets.push_back(
      new Target("yes", {"yes.s", "aceutils.inc"}, "fasm yes.s"));
  rebuild_targets.push_back(
      new Target("no", {"no.s", "aceutils.inc"}, "fasm no.s"));
  rebuild_targets.push_back(
      new Target("rm", {"rm.s", "aceutils.inc"}, "fasm rm.s"));
  rebuild_targets.push_back(
      new Target("cat", {"cat.s", "aceutils.inc"}, "fasm cat.s"));
  rebuild_targets.push_back(
      new Target("uname", {"uname.s", "aceutils.inc"}, "fasm uname.s"));
  rebuild_targets.push_back(
      new Target("true", {"true.s", "aceutils.inc"}, "fasm true.s"));
  rebuild_targets.push_back(
      new Target("false", {"false.s", "aceutils.inc"}, "fasm false.s"));
  rebuild_targets.push_back(new Target(
      "echo", {"echo.s", "aceutils.inc", "strlen.inc"}, "fasm echo.s"));
  rebuild_targets.push_back(new Target(
      "exsleep", {"exsleep.s", "aceutils.inc", "atoi.inc"}, "fasm exsleep.s"));
  rebuild_targets.push_back(new Target(
      "seq", {"seq.s", "aceutils.inc", "atoi.inc", "itoa.inc", "memset.inc"},
      "fasm seq.s"));
  rebuild_targets.push_back(
      new Target("arch", {"arch.s", "aceutils.inc"}, "fasm arch.s"));
  rebuild_targets.push_back(new Target(
      "gettime", {"gettime.s", "aceutils.inc", "itoa.inc"}, "fasm gettime.s"));
  rebuild_targets.push_back(
      new Target("kill", {"kill.s", "aceutils.inc", "atoi.inc", "signal.inc"},
                 "fasm kill.s"));
  rebuild_targets.push_back(
      new Target("sync", {"sync.s", "aceutils.inc"}, "fasm sync.s"));
  return 0;
}
