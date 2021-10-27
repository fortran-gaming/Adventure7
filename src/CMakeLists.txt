add_library(advmods OBJECT advmods.f90)

add_library(sound OBJECT sound.f90)
add_library(bug OBJECT bug.f90)
target_link_libraries(sound PRIVATE advmods)


add_executable(adventure
class.f90 rating.f90 treasure.f90 vocabx.f90 clrlin.f90 val.f90 drop.f90 insert.f90 carry.f90 asubs.f90 athand.f90 toting.f90 move.f90 remove.f90 speak.f90 upper_case.f90 poof.f90 pspeak.f90 not_toting_spk.f90 yes.f90 color.f90 burden.f90 lookin.f90 getlin.f90 replace.f90 ljust.f90 travl.f90 getwds.f90 getobj.f90 wait.f90 adventure.f90)
target_link_libraries(adventure PRIVATE sound bug advmods)

add_executable(advgen
class.f90 rating.f90 treasure.f90 vocabx.f90 advgendat.f90 clrlin.f90 val.f90 drop.f90 insert.f90 carry.f90)
target_link_libraries(advgen PRIVATE bug advmods)
add_custom_command(TARGET advgen POST_BUILD
COMMAND $<TARGET_FILE:advgen>
WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
BYPRODUCTS ${PROJECT_BINARY_DIR}/adv.dat
)

add_executable(testsound TestSound.f90)
target_link_libraries(testsound PRIVATE sound advmods)

add_test(NAME ShortGame
COMMAND ${CMAKE_COMMAND} -Dexe:FILEPATH=$<TARGET_FILE:adventure> -Dargs=-nosound -Din:FILEPATH=${PROJECT_SOURCE_DIR}/tests/testinput.txt -P ${PROJECT_SOURCE_DIR}/cmake/run.cmake
WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
)
set_tests_properties(ShortGame PROPERTIES
TIMEOUT 30
REQUIRED_FILES ${PROJECT_BINARY_DIR}/adv.dat
)
