add_library(advmods OBJECT advmods.f90)

if(f2008)
  add_library(sound OBJECT sound.f90)
  add_library(bug OBJECT bug.f90)
else()
  add_library(sound OBJECT sound_legacy.f90)
  add_library(bug OBJECT bug_legacy.f90)
endif()
target_link_libraries(sound PRIVATE advmods)

add_executable(adventure class.f90 rating.f90 treasure.f90 vocabx.f90  clrlin.f90 val.f90 drop.f90 insert.f90 carry.f90 asubs.f90 athand.f90 toting.f90 move.f90 remove.f90 speak.f90 upper_case.f90 poof.f90 pspeak.f90 not_toting_spk.f90 yes.f90 color.f90 burden.f90 lookin.f90 getlin.f90 replace.f90 ljust.f90 travl.f90 getwds.f90 getobj.f90 wait.f90 adventure.f90)
target_link_libraries(adventure PRIVATE sound bug advmods)

add_executable(advgen class.f90 rating.f90 treasure.f90 vocabx.f90 advgendat.f90 clrlin.f90 val.f90 drop.f90 insert.f90 carry.f90)
target_link_libraries(advgen PRIVATE bug advmods)
add_test(NAME Generate COMMAND advgen
          WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
file(COPY ${PROJECT_SOURCE_DIR}/adv.txt
     DESTINATION ${PROJECT_BINARY_DIR})

add_executable(testsound TestSound.f90)
target_link_libraries(testsound PRIVATE sound advmods)

if (UNIX)
  add_test(NAME ShortGame COMMAND sh -c "./adventure -nosound < ../testinput.txt"
          WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
  set_tests_properties(ShortGame PROPERTIES FIXTURES_SETUP Generate)
  set_tests_properties(Generate ShortGame PROPERTIES TIMEOUT 30)
endif()

