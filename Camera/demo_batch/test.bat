%QUARTUS_ROOTDIR%\\bin\\quartus_pgm.exe -m jtag -c USB-Blaster[USB-0] -o "p;Camera.sof"
@ set SOPC_BUILDER_PATH=%SOPC_KIT_NIOS2%+%SOPC_BUILDER_PATH%

@ "%QUARTUS_ROOTDIR%\bin\cygwin\bin\bash.exe" --rcfile ".\test_bashrc"
pause