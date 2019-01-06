[![image](https://travis-ci.org/fortran-gaming/Adventure7.svg?branch=master)](https://travis-ci.org/fortran-gaming/Adventure7)
[![Build status](https://ci.appveyor.com/api/projects/status/1hih2kk792rpheym?svg=true)](https://ci.appveyor.com/project/scivision/adventure7)

# Adventure 7

Updated to actual Fortran 2008+ syntax, such as Gfortran 6 or Intel Fortran.

from <http://www.ifarchive.org/indexes/if-archiveXgamesXpc.html>

## Compile/setup

This game is cross-platform thanks to Fortran.

Linux / Mac / Windows Subsystem for Linux / Cygwin:
```sh
cd bin
cmake ../src
cmake --build .

./advgen
./adventure
```

### Windows

This assumes you're using the MinGW compiler. 
You can use any compiler
you like:
```sh
cd bin
cmake -G "MinGW Makefiles" ../src
cmake --build .

advgen
adventure
```

## Command line options

* `-c` cheat mode: (future) playback commands from plain-text file 
* `-d` debug mode: prints debug info 
* `-nosound` disables playback for systems without ffplay installed

## Game Versions

### Adventure 7 - GNU edition

Updated to true Fortran 2008 (where beneficial), removing proprietary
Intel compiler, Quickwin and Windows-only library dependencies. Attempt
at cross-platform sound using shell call, will soft-fail.

### Adventure 7

maximum 560 points. re-written in standard Fortran 2008 from Adventure 6
with corrections and additions of sounds, color, basilisk, mermaid and
ruby yacht by Neal Van Eck, 2011. Intel Fortran Composer Quickwin
project using a few Quickwin routines for color and Windows-specific
APIs for sound.

### Adventure 6

based on Adventure 5 with additions by David Long, and an anonymous coder around 1984. 
Doug McDonald changed it so that it would compile with f77 in 1990.

### Adventure 5

extended from the 350 point original to 501 points by David Long at the
University of Chicago around 1978.

## Test sound

Sound playback is via ffplay. Test by:
```sh
./testsound < testsound.txt
```

This was generated by:
```sh
ls -1 sounds | sed -e 's/.wav$//' > testsound.txt
```