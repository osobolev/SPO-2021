@echo off
set NASM=C:\asm\nasm.exe
set GCC=C:\mingw64\bin\gcc.exe

for %%f in (%1) do (
  del %%~nf.obj 2>nul
  del %%~nf.exe 2>nul
)
"%NASM%" -f win64 %1
for %%f in (%1) do (
  if exist %%~nf.obj "%GCC%" -o %%~nf %%~nf.obj
)
