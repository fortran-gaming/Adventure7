.. image:: https://travis-ci.org/scivision/Adventure7.svg?branch=master
    :target: https://travis-ci.org/scivision/Adventure7
    
.. image:: https://ci.appveyor.com/api/projects/status/3gpcw8haer49tyts?svg=true
    :target: https://ci.appveyor.com/project/scivision/adventure7
    
    
===========
Adventure 7
===========

Updated to actual Fortran 2008+ syntax.

from http://www.ifarchive.org/indexes/if-archiveXgamesXpc.html

.. contents::

Compile/setup
=============
This game is cross-platform thanks to Fortran.

Linux / Mac / Windows Subsystem for Linux / Cygwin
-----------
::

    cd bin
    cmake ../src
    make
    cd ..

    ./advgen
    ./adventure

Windows
-------
This assumes you're using the MinGW compiler.
You can use any compiler you like.::

    cd bin
    cmake -G "MinGW Makefiles" ../src
    mingw32-make
    cd ..

    advgen
    adventure

Command line options
====================

-c            cheat mode: (future) playback commands from plain-text file
-d            debug mode: prints debug info
-nosound      disables playback for systems without `ffplay` installed

Game Versions
=============

Adventure 7 - GNU edition
-------------------------
Updated to true Fortran 2008 (where beneficial), removing proprietary Intel compiler, Quickwin and Windows-only library dependencies.
Attempt at cross-platform sound using shell call, will soft-fail.

Adventure 7
-----------
maximum 560 points. re-written in standard Fortran 2008 from Adventure 6 with corrections and additions
of sounds, color, basilisk, mermaid and ruby yacht by Neal Van Eck, 2011.
Intel Fortran Composer Quickwin project using a few Quickwin routines for color and Windows-specific APIs for sound.

Adventure 6
-----------
based on Adventure 5 with additions by David Long, and an anonymous coder around 1984.
Doug McDonald changed it so that it would compile with f77 in 1990.

Adventure 5
-----------
extended from the 350 point original to 501 points by David Long at the University of Chicago around 1978.

