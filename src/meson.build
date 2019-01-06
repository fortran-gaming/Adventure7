project('adv7', 'fortran', 
  default_options : ['default_library=static'])

fc = meson.get_compiler('fortran')
f2008 = fc.compiles('''call execute_command_line(" "); end''', name : 'f2008 execute_command_line')

advmods = library('advmods', 'advmods.f90')

if f2008
  sound = library('sound', 'sound.f90', link_with : advmods)
  bug = library('bug', 'bug.f90')
else
  sound = library('sound', 'sound_legacy.f90', link_with : advmods)
  bug = library('bug', 'bug_legacy.f90')
endif

adv7 = executable('adventure', 'class.f90', 'rating.f90', 'treasure.f90', 'vocabx.f90', 'clrlin.f90', 'val.f90', 'drop.f90', 'insert.f90', 'carry.f90', 'asubs.f90', 'athand.f90', 'toting.f90', 'move.f90', 'remove.f90', 'speak.f90', 'upper_case.f90', 'poof.f90', 'pspeak.f90', 'not_toting_spk.f90', 'yes.f90', 'color.f90', 'burden.f90', 'lookin.f90', 'getlin.f90', 'replace.f90', 'ljust.f90', 'travl.f90', 'getwds.f90', 'getobj.f90', 'wait.f90', 'adventure.f90',
  link_with : [advmods, sound, bug])

advgen = executable('advgen', 'class.f90', 'rating.f90', 'treasure.f90', 'vocabx.f90', 'advgendat.f90', 'clrlin.f90', 'val.f90', 'drop.f90', 'insert.f90', 'carry.f90',
  link_with : [bug, advmods])
  
configure_file(input : '../adv.txt', output : 'adv.txt', copy : true)

test('Generate', advgen)

executable('testsound', 'TestSound.f90', link_with : [advmods, bug, sound])

