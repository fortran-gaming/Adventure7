cmake_minimum_required (VERSION 2.8.12)
project(adv7 Fortran)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ..)

add_compile_options(-Wline-truncation -g -fbacktrace -Wall -Wpedantic -Wextra -Wno-unused-dummy-argument)# -Wfatal-errors)

add_executable(adventure bug.f90 class.f90 rating.f90 treasure.f90 vocabx.f90 advmods.f90 clrlin.f90 val.f90 drop.f90 insert.f90 carry.f90  asubs.f90 athand.f90 toting.f90 move.f90 remove.f90 speak.f90 upper_case.f90 sound.f90 poof.f90 pspeak.f90 not_toting_spk.f90 yes.f90 wait.f90 color.f90 burden.f90 lookin.f90 getlin.f90 replace.f90 ljust.f90 travl.f90 getwds.f90 getobj.f90 adventure.f90)

add_executable(advgen bug.f90 class.f90 rating.f90 treasure.f90 vocabx.f90 advmods.f90 advgendat.f90 clrlin.f90 val.f90 drop.f90 insert.f90 carry.f90)

