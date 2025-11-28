@echo OFF
SET LIB=%LIB%;C:\irvine
SET INCLUDE=%INCLUDE%;C:\irvine

ml /c /coff practice.asm
link /SUBSYSTEM:CONSOLE practice.obj irvine32.lib user32.lib kernel32.lib /OUT:practice.exe
