@echo OFF
SET LIB=%LIB%;C:\irvine
SET INCLUDE=%INCLUDE%;C:\irvine

ml /c /coff practice3.asm
link /SUBSYSTEM:CONSOLE practice3.obj irvine32.lib user32.lib kernel32.lib /OUT:practice3.exe
